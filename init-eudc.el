;; this doesn't work

;; http://blog.ltsampros.eu/2011/01/17/gnus-eudc-ldap-bbdb

;; ldap://addressbook.bnl.gov:389/

(setq ldap-host-parameters-alist
      (quote (("addressbook.bnl.gov" base "dc=bnl,dc=gov"))))
 
(require 'eudc)
 
(setq eudc-default-return-attributes nil
      eudc-strict-return-matches nil)
 
(setq ldap-ldapsearch-args (quote ("-tt" "-LLL" "-x")))
 
(eudc-protocol-set 'eudc-inline-expansion-format 
		   '("%s < %s>" displayName email)
		   'ldap)
(eudc-protocol-set 'eudc-inline-query-format 
		   '((cn)
		     (mail)
		     (cn cn)
		     (cn cn cn)
		     (sn)
		     (uid)
		     (givenName)
		     (givenName name)
		     (name))
		   'ldap)
 
(eudc-protocol-set 'eudc-inline-expansion-format 
		   '("%s %s < %s>" firstname lastname net)
		   'bbdb)
(eudc-protocol-set 'eudc-inline-query-format 
		   '((name)
		     (firstname)
		     (lastname)
		     (firstname lastname)
		     (net))
		   'bbdb)
 
 
(eudc-set-server "localhost" 'bbdb t)
(setq eudc-server-hotlist '(("localhost" . bbdb)
			    ("addressbook.bnl.gov" . ldap)
			    ))
(setq eudc-inline-expansion-servers 'hotlist)

(defun enz-eudc-expand-inline()
  (interactive)
  (if (eq eudc-protocol 'ldap)
      (progn (move-end-of-line 1)
         (insert "*")
         (unless (condition-case nil
             (eudc-expand-inline)
               (error nil))
           (backward-delete-char-untabify 1)
           ))
    (eudc-expand-inline))
)
 
;; Adds some hooks
 
(eval-after-load "message"
  '(define-key message-mode-map (kbd "TAB") 'enz-eudc-expand-inline))

(provide 'init-eudc)
