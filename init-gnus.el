;; Set up GNUS

(setq 
 gnus-startup-file "~/gnus/.newsrc"
 gnus-directory "~/gnus/"
 gnus-dribble-directory "~/gnus/"
 mail-source-directory "~/gnus/incoming/"
 gnus-cache-directory "~/gnus/cache/"
)
(cond
 ((string= system-name "lycastus.phy.bnl.gov")
  (message "Using BNL")
  (setq gnus-init-file "~/git/dot-emacs/dot-gnus-lycastus.el"
	user-mail-address "bv@bnl.gov"))
 (t (message "Using not-BNL")
    (setq gnus-init-file "~/git/dot-emacs/dot-gnus-hal.el"
	  user-mail-address "bv@bnl.gov"))
)
;(setq gnus-init-file "~/git/dot-emacs/dot-gnus.el")
(setq gnus-inhibit-startup-message t)


(provide 'init-gnus)
