;; set up python mode

(add-auto-mode 'python-mode "SConstruct\\'")
(add-auto-mode 'python-mode "SConsscript\\'")
(add-auto-mode 'python-mode "\\.scons\\'")

(require-package 'pyflakes)
(require-package 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(provide 'init-python)
