;; setup programming language modes

;;;; setup c/c++ mode
(setq c-default-style '((c-mode . "cc-mode")
                        (c++-mode . "cc-mode")
                        (java-mode . "java")
                        (awk-mode . "awk")
                        (other . "gnu")))
;(setq c-offsets-alist '((substatement-open . 0)))
(add-auto-mode 'c++-mode "\\.cc$\\|\\.C$\\|\\.cxx$\\|\\.cpp$\\|\\.h$\\|\\.hpp$")
(add-auto-mode 'c-mode "\\.c$")

;(puppet)
(add-auto-mode 'ruby-mode "\\.pp$")

;;;; setup php
(add-auto-mode 'php-mode "\\.php[345]?\\'\\|\\.phtml\\.")

(require-package 'yaml-mode)
(require-package 'change-inner)


(provide 'init-programming)
