;;yasnippetの設定
(add-to-list 'load-path "~/.emacs.d/elisp/yasnippet");;site-lispにロードパスを通してる場合
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/elisp/snippets")
;;auto-completeの設定
(require 'auto-complete)
(require 'auto-complete-yasnippet)
(require 'auto-complete-acr)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
