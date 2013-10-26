;; Set up GNUS

(setq 
 gnus-startup-file "~/gnus/.newsrc"
 gnus-directory "~/gnus/"
 gnus-dribble-directory "~/gnus/"
 mail-source-directory "~/gnus/incoming/"
 gnus-cache-directory "~/gnus/cache/"
)
(cond
 ((string= system-name "hal.local")
  (setq gnus-init-file "~/git/dot-emacs/dot-gnus-hal.el"))
 ((string= system-name "lycastus")
  (setq gnus-init-file "~/git/dot-emacs/dot-gnus-lycastus.el"))
)
;(setq gnus-init-file "~/git/dot-emacs/dot-gnus.el")
(setq gnus-inhibit-startup-message t)


(provide 'init-gnus)
