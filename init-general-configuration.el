
;;;; various configuration functions

(column-number-mode t)	   ; display column number
(show-paren-mode t)	   ; visually match parens
(winner-mode t)		   ; C-c <left> to go back to previous windows
(global-subword-mode t)	   ; treat CamelCase as word boundaries
(delete-selection-mode t)  ; typing at a selected region replaces it
(which-function-mode t)	   ; display what function cursor is in
(prefer-coding-system 'utf-8)		; UTF everywhere
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;;;; various configuration variables 
(setq-default
 imenu-auto-rescan t
 indicate-empty-lines t
 ispell-extra-args (quote ("--sug-mode=ultra"))
 ispell-program-name "aspell"
 mouse-yank-at-point t
 redisplay-dont-pause t
 user-full-name "Brett Viren"
 user-mail-address "brett.viren@gmail.com"
)


(provide 'init-general-configuration)
