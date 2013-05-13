;; setup for editing shell scripts

;; doesn't seem to work...
(require-package 'flymake)
(require-package 'flymake-shell)
(add-hook 'sh-set-shell-hook 'flymake-shell-load)

(provide 'init-sh)
