(require 'flyspell)
(dolist (hook '(
		text-mode-hook
		))
      (add-hook hook (lambda () (flyspell-mode 1))))

(dolist (hook '(
		c++-mode-hook
		cc-mode-hook
		))
  (add-hook hook (lambda () (flyspell-prog-mode))))

(provide 'init-flyspell)
