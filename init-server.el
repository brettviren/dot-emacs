;;;; Start emacs server if it isn't already running
(require 'server)
(unless (server-running-p)
  (server-start))

(require 'edit-server)
(edit-server-start)

(provide 'init-server)
