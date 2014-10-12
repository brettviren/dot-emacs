(require-package 'yasnippet)
(require 'yasnippet)
(yas/global-mode 1)
(add-hook 'prog-mode-hook
          '(lambda ()
             (yas-minor-mode)))

;; fixme: how to locate snippets that come with yas given it's
;; directory name is built with a date-version string?
(setq yas-snippet-dirs
      '("~/dot/emacs/snippets"))


(provide 'init-yasnippet)
