(require 'flyspell)
(dolist (hook '(
		message-mode-hook
		text-mode-hook
		))
      (add-hook hook (lambda () (flyspell-mode 1))))

(dolist (hook '(
		c-mode-common-hook
		cc-mode-hook
		python-mode-hook
		))
  (add-hook hook (lambda () (flyspell-prog-mode))))

(provide 'init-flyspell)
