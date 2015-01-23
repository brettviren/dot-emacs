;;;
;;; dot-gnus for hal
;;;

;; Local system mail

(setq gnus-group-line-format "%M%S%p%P%5y:%B%(%G%)%l %O\n")

(setq gnus-select-method 
      '(nntp "news.gmane.org"))

(setq gnus-secondary-select-methods
      '(
	(nnimap "bnl"			; SSH port forward
		(nnimap-address "localhost")
		(nnimap-server-port 1143)
		(nnimap-stream network)
		(nnimap-authenticator login))
	;;; lose too many gmail'ish feature, use web....
	(nnimap "gmail"
		(nnimap-address "imap.gmail.com")
		(nnimap-server-port 993)
		(nnimap-stream ssl))
	))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "localhost"
      smtpmail-smtp-service "2525")
