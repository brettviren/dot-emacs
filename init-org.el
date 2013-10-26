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

(setq 
 org-agenda-files (quote ("~/org/home/todo.org" "~/org/work/todo.org"))
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
   
   ("m" "Meeting" entry
    (file+headline "~/org/todo.org" "Meetings")
    "\n\n** TODO %^{description} %^G
SCHEDULED: <%<%Y-%m-%d %a>>
ADDED: %U
URL: %^{url/phone}
%?
"
    :empty-lines 1)
			  
   
   ("w" "Work related things")
   
   ("wn" "Work notes" entry
    (file+datetree "~/org/work/notes.org") "")
   ("wt" "Work todo" entry
    (file+headline "~/org/work/todo.org") "")
   
   ("h" "Home related things")
   
   ("hn" "Home notes" entry
    (file+datetree "~/org/home/notes.org") "")

   ("ht" "Home Todo" entry
    (file+headline "~/org/todo.org" "To do")
    "\n\n** TODO %^{do what} %^G
SCHEDULED: <%<%Y-%m-%d %a>>
ADDED: %U
FROM: %a
%?" 
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



(provide 'init-org)

