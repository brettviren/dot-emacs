
; http://stackoverflow.com/questions/539984/how-do-i-get-emacs-to-fill-sentences-but-not-paragraphs
(defun auto-fill-by-sentences ()
  (if (looking-back (sentence-end))
      ;; Break at a sentence
      (progn
        (LaTeX-newline)
        t)
    ;; Fall back to the default
    (do-auto-fill)))
(add-hook 'LaTeX-mode-hook (lambda () (setq auto-fill-function 'auto-fill-by-sentences)))

;; Modified from http://pleasefindattached.blogspot.com/2011/12/emacsauctex-sentence-fill-greatly.html
(defadvice LaTeX-fill-region-as-paragraph (around LaTeX-sentence-filling)
  "Start each sentence on a new line."
  (let ((from (ad-get-arg 0))
        (to-marker (set-marker (make-marker) (ad-get-arg 1)))
        tmp-end)
    (while (< from (marker-position to-marker))
      (forward-sentence)
      ;; might have gone beyond to-marker---use whichever is smaller:
      (ad-set-arg 1 (setq tmp-end (min (point) (marker-position to-marker))))
      ad-do-it
      (ad-set-arg 0 (setq from (point)))
      (unless (or (looking-back "^\\s *")
                  (looking-at "\\s *$")) 
        (LaTeX-newline)))
    (set-marker to-marker nil)))
(ad-activate 'LaTeX-fill-region-as-paragraph)

(provide 'init-latex)

