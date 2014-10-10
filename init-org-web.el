;; old pub attempt

;;; Blerg
(add-to-list 'load-path "~/git/org-mode/contrib/lisp/")
;(require 'ox-rss)
(setq org-publish-project-alist
      '(
	("web-notes"
	 :base-directory "~/org/web/notes/"
	 :base-extension "org"
	 :publishing-directory "~/git/web/notes/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4 
	 :html-extension "html"
         :html-preamble "They Call Me Brett"
         :html-postamble "made with Emacs and org-mode"
         :style "This is raw html for stylesheet <link>'s"
         :author nil
         :export-creator-info nil
         :section-numbers nil
         :with-toc nil
	 :body-only nil
         :timestamp t
         :exclude-tags ("noexport" "todo")
         :auto-preamble t
         :auto-sitemap t
         :makeindex t
	 :html-head-extra
         "<link rel=\"alternate\" type=\"application/rss+xml\"
                href=\"http://mydomain.org/my-blog.xml\"
                title=\"RSS feed for mydomain.org\">"
	 )
	("web-notes-org"
	 :base-directory "~/org/web/notes/"
	 :base-extension "org"
	 :publishing-directory "~/git/web/notes/"
	 :recursive t
	 :publishing-function org-org-publish-to-org
	 :htmlized-source t
	 :headline-levels 4 
	 :html-extension "html"
	 :body-only t ;; Only export section between <body> </body>
	 )

	("web-notes-rss"
	 :base-directory "~/org/web/notes"
	 :base-extension "org"
	 :publishing-directory "~/git/web/notes/rss/"
	 :publishing-function (org-rss-publish-to-rss)
	 :html-link-home "http://mydomain.org/"
	 :html-link-use-abs-url t
	 )


	("web-topics"
	 :base-directory "~/org/web/topics/"
	 :base-extension "org"
	 :publishing-directory "~/git/web/topics/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4 
	 :html-extension "html"
	 :body-only t ;; Only export section between <body> </body>
	 )

	("web-files"
	 :base-directory "~/git/web/files/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
	 :publishing-directory "~/git/web/files/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )

	("web" :components (
			    "web-notes" 
			    ;"web-notes-org" 
			    "web-topics" 
			    "web-files"
			    ))
	))

(provide 'init-org-web)
