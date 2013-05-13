;; set up notmuch

(add-to-list 'load-path "~/opt/notmuch/share/emacs/site-lisp")
(require 'notmuch)

;; From notmuch mailing list
(require 'org-gnus)
(defun th-notmuch-file-to-group (file)
 "Calculate the Gnus group name from the given file name.

Example:

 IN: /home/horn/Mail/Dovecot/uni/INBOX/dbox-Mails/u.4075
 OUT: nnimap+Uni:INBOX"
 (message file)
 (concat "nnimap+bnl:"
         (replace-regexp-in-string
          "/.*" ""
          (replace-regexp-in-string
           "/home/bviren/Maildir/\." "" file))))

(defun th-notmuch-goto-message-in-gnus ()
 "Open a summary buffer containing the current notmuch
article."
 (interactive)
 (let ((group (th-notmuch-file-to-group (notmuch-show-get-filename)))
       (message-id (replace-regexp-in-string
                    "\"" ""
                    (replace-regexp-in-string
                    "^id:" "" (notmuch-show-get-message-id)))))
   (message "G: %s, mid: %s" group message-id)
   (if (and group message-id)
       (org-gnus-follow-link group message-id)
     (message "Couldn't get relevant infos for switching to Gnus."))))

(define-key notmuch-show-mode-map (kbd "C-c C-c")
  'th-notmuch-goto-message-in-gnus)


(provide 'init-notmuch)
