;;windoe
(when (eq window-system 'mac)
  (add-hook 'window-setup-hook
            (lambda ()
;;              (setq mac-autohide-menubar-on-maximize t)
              (set-frame-parameter nil 'fullscreen 'fullboth)
              )))
;;丸文字フォント
(if (eq window-system 'mac)
   (progn
    (require 'carbon-font)
     (fixed-width-set-fontset "hiramaru" 12)))
;     (fixed-width-set-fontset "hirakaku_w3" 12)))


(defun mac-toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

;; Carbon Emacsの設定で入れられた. メニューを隠したり．
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("~/Dropbox/Matlab/")))
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;;Color
(if window-system (progn
   (set-background-color "Black")
   (set-foreground-color "LightGray")
   (set-cursor-color "Gray")
   (set-frame-parameter nil 'alpha 80)
   ))


;;control-hでバックスペース
;;(load "term/bobcat")
;;(when (fboundp 'terminal-init-bobcat) (terminal-init-bobcat))

;;行カーソル
(defface hlline-face
  '((((class color)
      (background dark))
     ;;(:background "dark state gray"))
     (:background "gray10"
                  :underline "gray24"))
    (((class color)
      (background light))
     (:background "ForestGreen"
                  :underline nil))
    (t ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
;;(setq hl-line-face 'underline)
(global-hl-line-mode)

;;起動画面
(setq inhibit-startup-message t)

;;shift+->
(setq windowmove-wrap-around t)
(windmove-default-keybindings)

;;; 画像ファイルを表示する
;;(auto-image-file-mode t)
;;(iimage-mode t)
(setq iimage-mode-image-search-path '("/Users/okitsukengo/Pictures/screenshot/"))
