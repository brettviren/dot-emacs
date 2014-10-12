;; Set up GNUS

(require 'nnmairix)

(setq 
 gnus-startup-file "~/gnus/.newsrc"
 gnus-directory "~/gnus/"
 gnus-dribble-directory "~/gnus/"
 mail-source-directory "~/gnus/incoming/"
 gnus-cache-directory "~/gnus/cache/"
 ;gnus-summary-line-format "%U%R%z%I%(%[%4L: %-23,23f%]%) %[%&user-date;%] %s\n"
 gnus-summary-line-format "%U%R%z%I%(%[%4L: %-23,23f%]%) %s\n"
)
(cond
 ((string= system-name "hal.local")
  (message "Using HAL")
  (setq gnus-init-file "~/dot/emacs/dot-gnus-hal.el"
	user-mail-address "brett.viren@gmail.com"))
 ((string= system-name "lycastus.phy.bnl.gov")
  (message "Using LYCASTUS")
  (setq gnus-init-file "~/dot/emacs/dot-gnus-lycastus.el"
	user-mail-address "bv@bnl.gov"))
)
;(setq gnus-init-file "~/dot/emacs/dot-gnus.el")
(setq gnus-inhibit-startup-message t)


(provide 'init-gnus)
