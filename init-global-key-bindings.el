;; Set global key bindings

(global-set-key "\C-H" 'delete-backward-char)
(global-set-key "\M-\C-H" 'backward-kill-word)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-cw" 'ispell-word)
(global-set-key "\C-cb" 'ispell-buffer)
(global-set-key "\C-x\C-y" 'browse-kill-ring)
(global-set-key "\M-I" 'change-inner)
(global-set-key "\M-O" 'change-outer)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(provide 'init-global-key-bindings)
