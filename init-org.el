;; setup lovely org mode

(add-to-list 'load-path (expand-file-name "~/git/dot-emacs/elisp/org-mode/lisp"))

(require 'org)
(require 'org-protocol)
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
(defun bv-daily-file (base file)
  (let ((note-file (concat base
			   (format-time-string "%Y/%m/%d/") file)))
    (mkdir (file-name-directory note-file) t)
    (find-file note-file)
    (goto-char (point-max))
    (newline 2))
)

(defun bv-daily-note-file () (bv-daily-file "~/org/web/notes/" "notes.org"))
(defun bv-daily-blog-file () (bv-daily-file "~/org-pub/log/" "index.org"))

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
	 (slug (completing-read "Topic slug: " existing-slugs))
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


;; https://github.com/suvayu/.emacs.d/blob/master/lisp/nifty.el
;; http://stackoverflow.com/questions/11384516/
;; recursively find .org files in provided directory
;; modified from an Emacs Lisp Intro example
(defun find-org-file-recursively (directory &optional filext)
  "Return .org and .org_archive files recursively from DIRECTORY.
If FILEXT is provided, return files with extension FILEXT instead."
  ;; FIXME: interactively prompting for directory and file extension
  (let* (org-file-list
	 (case-fold-search t)		; filesystems are case sensitive
	 (file-name-regex "^[^.#].*")	; exclude .*
	 (filext (if filext filext "org$\\\|org_archive"))
	 (fileregex (format "%s\\.\\(%s$\\)" file-name-regex filext))
	 (cur-dir-list (directory-files directory t file-name-regex)))
    ;; loop over directory listing
    (dolist (file-or-dir cur-dir-list org-file-list) ; returns org-file-list
      (cond
       ((file-regular-p file-or-dir) ; regular files
	(if (string-match fileregex file-or-dir) ; org files
	    (add-to-list 'org-file-list file-or-dir)))
       ((file-directory-p file-or-dir)
	(dolist (org-file (find-org-file-recursively file-or-dir filext)
			  org-file-list) ; add files found to result
	  (add-to-list 'org-file-list org-file)))))))


;(setq org-protocol-default-template-key "x")
(setq  
 org-agenda-files (list "~/org")	; also can use C-c [
 org-agenda-text-search-extra-files (find-org-file-recursively "~/org-pub/topics/")
)

(setq 
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
    (function bv-daily-note-file)
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

   ("l" "Blog log update" plain
    (function bv-daily-blog-file)
    (file "~/org-pub/templates/blog-entry.template")
    )

   ("x" "X11 clipboard" entry
    (file+datetree "~/org/clippings.org")
    "\n* %^{blurb}
#+BEGIN_EXAMPLE
%x
#+END_EXAMPLE
"
    :empty-lines 1)

   ("L" "Links from X11 clipboard" entry
    (file+datetree "~/org/links.org")
    "\n*^L"
    :empty-lines 1)


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


(defun make-capture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (make-frame '((name . "capture")))
  (select-frame-by-name "capture")
  (delete-other-windows)
  (org-capture)
  )
(defadvice org-capture-finalize (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame if it is the capture frame"
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame)))

(provide 'init-org)

