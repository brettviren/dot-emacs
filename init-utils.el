
;; quells:  Symbol's function definition is void: first
(eval-when-compile (require 'cl))


;; https://github.com/purcell/emacs.d/blob/master/init-utils.el
(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(provide 'init-utils)
