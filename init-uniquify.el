(require 'uniquify)

(setq
 uniquify-buffer-name-style 'forward
 uniquify-ignore-buffers-re "^\\*"
 uniquify-separator " • "
)

(provide 'init-uniquify)
