;; Set up (non-GNUS) email

;; If we rely on OfflineIMAP to fill Maildir talk to the IMAP
;; server directly to avoid authentication.  In gnus-init-file set
;; nnimap-stream to shell to make use of this.
;(setq imap-shell-program '("MAIL=maildir:$HOME/Maildir /usr/lib/dovecot/imap"))
;(setq imap-shell-program "/usr/lib/dovecot/imap -c ~/.dovecotrc")



(require 'init-bbdb)
(require 'init-gnus)
;(require 'init-notmuch)

(provide 'init-email)
