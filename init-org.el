;; setup lovely org mode

(require 'org)
(setq org-directory "~/git/org-directory")
(setq org-default-notes-file (concat org-directory "/notes.org"))
;(add-hook 'message-mode-hook 'turn-on-orgstruct)
;(add-hook 'message-mode-hook 'turn-on-orgstruct++)

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
(provide 'init-org)
