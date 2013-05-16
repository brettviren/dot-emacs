;; set up python mode

(add-auto-mode 'python-mode "SConstruct\\'")
(add-auto-mode 'python-mode "SConsscript\\'")
(add-auto-mode 'python-mode "\\.scons\\'")

(require-package 'pyflakes)
(require-package 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(add-hook 'python-mode-hook
	  (lambda ()
	    (message "Adding my hooks to python mode")
	    (local-set-key "\C-cfn" 'flymake-goto-next-error)
	    (local-set-key "\C-cfp" 'flymake-goto-prev-error)
	    (local-set-key "\C-cfe" 'flymake-display-err-menu-for-current-line)
	    ))

(provide 'init-python)
