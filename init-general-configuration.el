
;;;; various configuration functions

(column-number-mode t)	   ; display column number
(show-paren-mode t)	   ; visually match parens
(winner-mode t)		   ; C-c <left> to go back to previous windows
(global-subword-mode nil)  ; treat CamelCase as word boundaries, or don't
;;(delete-selection-mode t)  ; typing at a selected region replaces it -- NO! evil
(which-function-mode t)	   ; display what function cursor is in
(prefer-coding-system 'utf-8)		; UTF everywhere
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;;;; various configuration variables 
(setq-default
 imenu-auto-rescan t
 indicate-empty-lines t
 mouse-yank-at-point t
 redisplay-dont-pause t
 user-full-name "Brett Viren"
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "~/share/web-browser"
)


(provide 'init-general-configuration)
