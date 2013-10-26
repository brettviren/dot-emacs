;;;
;;; dot-gnus for hal
;;;

;; Local system mail

(setq gnus-select-method 
      '(nnimap "gmail"
	       (nnimap-address "imap.gmail.com")
	       (nnimap-server-port 993)
	       (nnimap-stream ssl)))

;; (add-to-list 'gnus-secondary-select-methods 
;; 	     '(nnimap "gmail"
;; 		      (nnimap-address "imap.gmail.com")
;; 		      (nnimap-server-port 993)
;; 		      (nnimap-stream ssl)))


(add-to-list 'gnus-secondary-select-methods
	     '(nntp "news.gmane.org"))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "brett.viren@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)
;      smtpmail-local-domain "yourcompany.com")
