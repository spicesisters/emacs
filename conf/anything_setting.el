;; anything.elの設定
(require 'anything-config)
(define-key global-map (kbd "C-x b") 'anything)
(setq anything-sources
      '(anything-c-source-buffers
	anything-c-source-emacs-commands
	anything-c-source-file-name-history
	anything-c-source-locate
	anything-c-source-man-pages
	anything-c-source-occur
	anything-c-source-recentf
	anything-c-source-R-local
	anything-c-source-R-help
	))
