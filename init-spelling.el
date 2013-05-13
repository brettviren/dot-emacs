(require 'ispell)

(setq
 ispell-extra-args (quote ("--sug-mode=ultra"))
 ispell-program-name "aspell")

(when (executable-find ispell-program-name)
  (require 'init-flyspell))

(provide 'init-spelling)
