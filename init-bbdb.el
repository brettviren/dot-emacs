;; Set up big brother database

(require-package 'bbdb)
(bbdb-initialize)

(setq
 bbdb-north-american-phone-numbers-p nil ;; allow other phone numbers
 bbdb-offer-save 1                       ;; save w/out asking
 ;bbdb-use-pop-up t                      ;; allow popups for addresses
 bbdb-electric-p t                       ;; be disposable with SPC
 ;bbdb-popup-target-lines  1             ;; very small
 bbdb-dwim-net-address-allow-redundancy t ;; always use full name
 bbdb-quiet-about-name-mismatches t       ;; don't show name-mismatches 2 secs
 bbdb-always-add-address nil              ;; add new addresses to existing...
                                          ;; ...contacts automatically
 ;bbdb-canonicalize-redundant-nets-p t    ;; x@foo.bar.cx => x@bar.cx
 bbdb-completion-type nil                 ;; complete on anything
 bbdb-complete-name-allow-cycling t       ;; cycle through matches
 bbbd-message-caching-enabled t           ;; be fast
 bbdb-use-alternate-names t               ;; use AKA
 bbdb-elided-display t                    ;; single-line addresses
 bbdb/news-auto-create-p nil            ;; auto create entries in bbdb
 bbdb-new-nets-always-primary 42
 bbdb-display-layout-alist 
 '((one-line
    (order phones mail-alias net notes)
    (name-end . 24)
    (toggle . t))
    (omit creation-date timestamp AKA)
   (multi-line
    (order phones mail-alias net notes)
    (omit creation-date timestamp AKA)
    (toggle . t))
   (pop-up-multi-line
    (omit creation-date timestamp AKA))
   (full-multi-line)
    (omit creation-date timestamp AKA))

 ;; http://www.emacswiki.org/emacs/BbdbConfiguration
; bbdb-ignore-some-messages-alist (quote (("From" . "meetings.readytalk.com")))
; bbdb/news-auto-create-p (quote bbdb-ignore-some-messages-hook)
)					;end setq

(global-set-key "\C-cB" 'bbdb)
(add-hook 'mail-setup-hook 'bbdb-mail-aliases)
(add-hook 'message-setup-hook 'bbdb-mail-aliases)




(provide 'init-bbdb)
