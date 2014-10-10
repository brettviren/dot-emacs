;; Set up GNUS

(setq 
 gnus-startup-file "~/gnus/.newsrc"
 gnus-directory "~/gnus/"
 gnus-dribble-directory "~/gnus/"
 mail-source-directory "~/gnus/incoming/"
 gnus-cache-directory "~/gnus/cache/"
)
(cond
 ((or 
   (string= system-name "hal.local")
   (string= system-name "hal"))
  (message "Using HAL")
  (setq gnus-init-file "~/git/dot-emacs/dot-gnus-hal.el"
	user-mail-address "bv@bnl.gov"))

 ((string= system-name "lycastus.phy.bnl.gov")
  (message "Using LYCASTUS")
  (setq gnus-init-file "~/git/dot-emacs/dot-gnus-lycastus.el"
	user-mail-address "bv@bnl.gov"))
)
;(setq gnus-init-file "~/git/dot-emacs/dot-gnus.el")
(setq gnus-inhibit-startup-message t)


(provide 'init-gnus)
