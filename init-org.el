;; setup lovely org mode

(require 'org)
;(require 'org-screenshot)
;(require 'o-blog)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-directory "~/git/org-directory")
(setq org-default-notes-file (concat org-directory "/notes.org"))

;(setq org-mobile-directory "~/Dropbox/MobileOrg")
;(setq org-mobile-directory "~/mo")
;(setq org-mobile-files '("~/git/org-directory/todo.org" "~/git/org-directory/notes.org"))
;(setq org-mobile-inbox-for-pull "~/git/org-directory/from-mobile.org")
;(add-hook 'message-mode-hook 'turn-on-orgstruct)
;(add-hook 'message-mode-hook 'turn-on-orgstruct++)

(defun bv-post () 
  "Post this file"
  (interactive)
  (save-buffer)
  (org-latex-export-to-pdf)
  (org-html-export-to-html)
)

(add-hook 'org-mode-hook 
	  (lambda ()
	    'turn-on-font-lock
	    (visual-line-mode)
	    (variable-pitch-mode t)
	    ;(setq word-wrap 1)
	    (setq truncate-lines nil)
	    (local-set-key [f10] 'bv-post)
	    (flyspell-mode 1)))


(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (ditaa . t)
   (dot . t)
   (sqlite . t)
   ))

;; I'm trusting, so far so goo$!%$$($#3!!@
(setq org-confirm-babel-evaluate nil)

;; We turn on variable-pitch-mode in the mode hook, but don't want it
;; turned on for code/verbatim blocks.  Do "M-x list-faces-display" to
;; get a list of face names or "C-u C-x =" to see what is in affect at
;; the point.
;; 
(set-face-attribute 'org-table nil :inherit 'fixed-pitch)
(set-face-attribute 'org-verbatim nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil :inherit 'fixed-pitch)
(set-face-attribute 'org-block nil :inherit 'fixed-pitch)
(set-face-attribute 'org-block-background nil :inherit 'fixed-pitch)

;; Pretty code blocks
;; http://orgmode.org/worg/org-contrib/babel/examples/fontify-src-code-blocks.html
(setq org-src-fontify-natively t)

;; Custom external links
;; http://orgmode.org/manual/Adding-hyperlink-types.html#Adding-hyperlink-types
;; http://orgmode.org/manual/Link-abbreviations.html#Link-abbreviations
(defun bv-link-resolve-github (tag)
  (replace-regexp-in-string ":" "/blob/master/" tag))

(setq org-link-abbrev-alist
      '(
	("ghsite" . "https://github.com/brettviren/%h")
	("ghfile" . "https://github.com/brettviren/%(bv-link-resolve-github)")
	("dbtrac" . "http://dayabay.ihep.ac.cn/tracs/dybsvn/ticket/%h")
	))


;; Capture templates
(defun bv-daily-log-file ()
  (let ((note-file (concat "~/org/web/notes/" 
			   (format-time-string "%Y/%m/%d/") "notes.org")))
    (mkdir (file-name-directory note-file) t)
    (find-file note-file)
    (goto-char (point-max))
    (newline 2))
)

(defun bv-existing-slugs (base-dir)
  (delq nil
	(mapcar (lambda (s)
		  (and (not (string= (substring s 0 1) "."))
		       (file-directory-p (concat base-dir s))
		       s))
		(directory-files base-dir))))
;(bv-existing-slugs "~/org-pub/topics/")

(defun bv-blog-topic-file () 
  (let* ((bv-topic-base-dir "~/org-pub/topics/")
	 (existing-slugs (bv-existing-slugs bv-topic-base-dir))
	 (slug
	  (read-from-minibuffer 
	   "Topic slug: "
	   (car existing-slugs) nil nil 'existing-slugs))
	 (topic-dir (concat 
		     bv-topic-base-dir
		     (replace-regexp-in-string 
		      " " "-" slug))))
    (let ((blog-file (concat topic-dir "/index.org")))
      (unless (file-exists-p blog-file)
	(mkdir topic-dir t))
      (find-file blog-file)
      (goto-char (point-max)))))
;(bv-blog-topic-file)

(defun bv-blog-entry-file ()
  (let ((note-file (concat "~/org-pub/blog/" 
			   (format-time-string "%Y-%m-%d.org"))))
    (mkdir (file-name-directory note-file) t)
    (find-file note-file)
    (goto-char (point-max))
    (newline 2))
)

(setq 
 org-agenda-files (quote ("~/org/todo.org"))
 org-capture-templates 
 (quote 
  (
   ("t" "Todo" entry
    (file+headline "~/org/todo.org" "To do")
    "\n\n** TODO %^{do what} %^G
SCHEDULED: <%<%Y-%m-%d %a>>
ADDED: %U
FROM: %a
%?" 
    :empty-lines 1)
   

   ("n" "Note" entry
    (function bv-daily-log-file)
    "\* %U %^{title}\n  %a\n\n%?"
    :empty-lines 1)

   ("B" "Blog start topic" plain
    (function bv-blog-topic-file)
    (file "~/org-pub/templates/topic-start.template")
    )

   ("b" "Blog update topic" entry
    (function bv-blog-topic-file)
    (file "~/org-pub/templates/topic-update.template")
    )

   ("l" "Blog log update" entry
    (file+datetree "~/org-pub/log/latest.org")
    (file "~/org-pub/templates/blog-entry.template")
    )

   ("g" "General" entry
    (file+headline "~/org/general.org" "General")
    "\* %U %^{title}\n  %a\n\n%?"
    :empty-lines 1)


   ("m" "Meeting" entry
    (file+headline "~/org/todo.org" "Meetings")
    "\n\n** TODO %^{description} %^G
SCHEDULED: <%<%Y-%m-%d %a>>
ADDED: %U
URL: %^{url/phone}
%?
"
    :empty-lines 1)
   
   )))



;; '(org-capture-templates (quote 
;; (("t" "Todo" entry (file+headline "~/org/newgtd.org" "TACHES") "* TODO %^{Brief description} %^g
;;  %?   
;;     Added: %U
;; %i
;; %a") ("n" "Notes" entry (file+datetree "~/org/journal.org") "* %^{topic} %T %^g
;; %i%?
;; %a") ("d" "Scheduled appointment" entry (file+headline "~/org/newgtd.org" "TACHES") "* TODO %^{Brief description} %^g
;;  %?   
;;     SCHEDULED: %t
;; %i
;; %a"))))


;;; Blerg
(add-to-list 'load-path "~/git/org-mode/contrib/lisp/")
(require 'ox-rss)
(setq org-publish-project-alist
      '(
	("web-notes"
	 :base-directory "~/org/web/notes/"
	 :base-extension "org"
	 :publishing-directory "~/git/web/notes/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4 
	 :html-extension "html"
         :html-preamble "They Call Me Brett"
         :html-postamble "made with Emacs and org-mode"
         :style "This is raw html for stylesheet <link>'s"
         :author nil
         :export-creator-info nil
         :section-numbers nil
         :with-toc nil
	 :body-only nil
         :timestamp t
         :exclude-tags ("noexport" "todo")
         :auto-preamble t
         :auto-sitemap t
         :makeindex t
	 :html-head-extra
         "<link rel=\"alternate\" type=\"application/rss+xml\"
                href=\"http://mydomain.org/my-blog.xml\"
                title=\"RSS feed for mydomain.org\">"
	 )
	("web-notes-org"
	 :base-directory "~/org/web/notes/"
	 :base-extension "org"
	 :publishing-directory "~/git/web/notes/"
	 :recursive t
	 :publishing-function org-org-publish-to-org
	 :htmlized-source t
	 :headline-levels 4 
	 :html-extension "html"
	 :body-only t ;; Only export section between <body> </body>
	 )

	("web-notes-rss"
	 :base-directory "~/org/web/notes"
	 :base-extension "org"
	 :publishing-directory "~/git/web/notes/rss/"
	 :publishing-function (org-rss-publish-to-rss)
	 :html-link-home "http://mydomain.org/"
	 :html-link-use-abs-url t
	 )


	("web-topics"
	 :base-directory "~/org/web/topics/"
	 :base-extension "org"
	 :publishing-directory "~/git/web/topics/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4 
	 :html-extension "html"
	 :body-only t ;; Only export section between <body> </body>
	 )

	("web-files"
	 :base-directory "~/git/web/files/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
	 :publishing-directory "~/git/web/files/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )

	("web" :components (
			    "web-notes" 
			    ;"web-notes-org" 
			    "web-topics" 
			    "web-files"
			    ))
	))

(provide 'init-org)

