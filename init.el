;; My emacs init file.
;; inspired by
;; - http://milkbox.net/note/single-file-master-emacs-configuration/
;; - https://github.com/purcell/emacs.d/blob/master/init.el



;; Mellow the display
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-screen t)

(add-to-list 'load-path "~/dot/emacs")
(add-to-list 'load-path "~/dot/emacs/elisp")
(defconst *is-a-gui* (display-graphic-p))

;; early
(require 'init-utils)

(require 'init-packages)
(require 'init-global-key-bindings)
(require 'init-general-configuration)
(require 'init-programming)
(when *is-a-gui* (require 'init-gui))


;; setup packages
(require 'init-uniquify)
(require 'init-git)
(require 'init-sh)
(require 'init-tex)
(require 'init-python)

(require 'init-spelling)
(require 'init-org)
(require 'init-latex)
(require 'init-evernote)
(require 'init-org-pub)
(require 'init-email)
(require 'init-theme)
;(require 'init-yasnippet)
;(require 'init-ag)

;;;; Set and load custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'init-server)
