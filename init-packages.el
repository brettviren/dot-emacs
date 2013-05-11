;; Love emacs packaging system

(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")
	("tromey" . "http://tromey.com/elpa/")
        ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)



(defun bv-install-packages ()
  "Install some packages"
  (interactive)
  (package-refresh-contents)
  (mapc '(lambda (package)
           (unless (package-installed-p package)
             (package-install package)))
        '(
	  yaml-mode
	  org
	  color-theme-solarized	  
	  change-inner
	  )
	))


(provide 'init-packages)
