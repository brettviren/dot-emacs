;; https://github.com/zpinter/emacs.d/tree/master/emacs-git-gutter/lisp
;; if want to use linenum mode then consider:
;; https://github.com/syohex/emacs-git-gutter-fringe

(require-package 'git-gutter)
(eval-after-load 'git-gutter
  (global-git-gutter-mode t))

(set-face-background 'git-gutter:modified "purple") ;; background color
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")
(setq git-gutter:window-width 1)
;(setq git-gutter:modified-sign "☁")
(setq git-gutter:modified-sign "M")
;(setq git-gutter:added-sign "☀")
(setq git-gutter:added-sign "A")
;(setq git-gutter:deleted-sign "☂")
(setq git-gutter:deleted-sign "D")
(setq git-gutter:unchanged-sign " ")
(set-face-background 'git-gutter:unchanged "black")

(provide 'init-git)
