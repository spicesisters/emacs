(setq load-path (cons "~/.emacs.d/elisp" load-path))
(setq load-path (cons "~/.emacs.d/elisp/emacs-jabber-0.8.0" load-path))
(setq load-path (cons "~/.emacs.d/conf" load-path))
;(setq load-path (cons "~/emacs-w3m" load-path))

;;auto save
(require 'auto-save-buffers)
(run-with-idle-timer 0.5 t 'auto-save-buffers) 

;; まず、install-elisp のコマンドを使える様にします。
(require 'install-elisp)
;; 次に、Elisp ファイルをインストールする場所を指定します。
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;;;;; ~/.emacs.d/elisp/　内に設定用elispファイルを分割設置->2010/11/13

;tex_setting.el読み込む
(load "tex_setting" t)
;window_setting.el読み込む
(load "window_setting" t)
;elscreen_setting.el読み込む
(load "elscreen_setting" t)
;viewmode_setting.el読み込む
(load "viewmode_setting" t)
;ecb_setting.el読み込む
(load "ecb_setting" t)
;matlab_setting.el読み込む
(load "matlab_setting" t)
;howm_setting.el読み込む
(load "howm_setting" t) 
;R_setting.el読み込む
(load "R_setting" t)
;anything_setting.el読み込む
(load "anything_setting" t)
;term_setting.el読み込む
(load "term_setting" t)
;wl_setting.el読み込む
(load "wl_setting" t)
;tw_setting.el読み込む
(load "tw_setting" t)
;key-chord_setting.el読み込む
(load "key-chord_setting" t)
;undo-tree.el from http://d.hatena.ne.jp/kitokitoki/20100211/p1
(require 'undo-tree)
(global-undo-tree-mode)
;instant messenger
;jabber.el from http://emacs-jabber.sourceforge.net/
(require 'jabber-autoloads)
;test

;;;;; ~/.emacs.d/elisp/　内に設定用elispファイルを分割設置->2010/11/13

;;w3m
;(load "~/.w3m.el")
;; 4.1. 基本
;;     次の設定を ‾/.emacs に追加してください．
;(require 'w3m-load)
;(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
;;w3m
;(setq exec-path (append exec-path '("/opt/local/bin")))
;(load "~/.w3m.el")
;(require 'w3m-load)
;(require 'mime-w3m)
