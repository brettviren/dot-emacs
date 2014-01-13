;; This directed by nikola-org-mode install but I think 
;; only needed it installed from source?


(let* ((org-lisp-dir "~/.emacs.d/org-lisp"))
  (when (file-directory-p org-lisp-dir)
    (add-to-list 'load-path org-lisp-dir)
    (require 'org)))
(require 'ox-html)


;; Custom configuration for the export.
;;; Add any custom configuration that you would like.
(setq
 org-export-with-toc nil
 org-export-with-section-numbers nil)

;; Export function used by Nikola.
(defun nikola-html-export (infile outfile)
  "Export the body only of the input file and write it to
specified location."

  (with-current-buffer (find-file infile)
    (org-html-export-as-html nil nil t t)
    (write-file outfile nil)))

(message "loaded init-nikola")
(provide 'init-nikola)
