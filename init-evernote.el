;; setup connection to evernote via evernote-mode

(add-to-list 'load-path "~/.emacs.d/evernote-mode")
(require 'evernote-mode)
(setq enh-enclient-command "/home/bviren/.emacs.d/evernote-mode/ruby/bin/enclient.rb")
(setq evernote-ruby-command "ruby1.9.1")
;; https://www.evernote.com/shard/s432/notestore
(setq evernote-developer-token "S=s432:U=491eedc:E=14e92b15c13:C=1473b002cc8:P=1cd:A=en-devtoken:V=2:H=75cfab8337939139d065c77c71dec9f9")

(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
(provide 'init-evernote)
