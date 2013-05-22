;; setup lovely org mode

(require 'org)
(setq org-directory "~/git/org-directory")
(setq org-default-notes-file (concat org-directory "/notes.org"))
;(add-hook 'message-mode-hook 'turn-on-orgstruct)
;(add-hook 'message-mode-hook 'turn-on-orgstruct++)

(add-hook 'org-mode-hook 
	  (lambda ()
	    'turn-on-font-lock
	    (visual-line-mode)
	    ;(setq word-wrap 1)
	    (setq truncate-lines nil)
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

;; I'm trusting
(setq org-confirm-babel-evaluate nil)


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



'(org-capture-templates (quote 
(("t" "Todo" entry (file+headline "~/org/newgtd.org" "TACHES") "* TODO %^{Brief description} %^g
 %?   
    Added: %U
%i
%a") ("n" "Notes" entry (file+datetree "~/org/journal.org") "* %^{topic} %T %^g
%i%?
%a") ("d" "Scheduled appointment" entry (file+headline "~/org/newgtd.org" "TACHES") "* TODO %^{Brief description} %^g
 %?   
    SCHEDULED: %t
%i
%a"))))

(provide 'init-org)

