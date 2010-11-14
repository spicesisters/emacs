;;insert date
(defun my-get-date-gen (form) (insert (format-time-string form)))
(defun my-get-date () (interactive) (my-get-date-gen "[%Y-%m-%d %H:%M]"))

;;key-chord
(require 'key-chord nil t)
(if (featurep 'key-chord)
    (progn
      (defadvice toggle-input-method
        (around toggle-input-method-around activate)
        (let ((input-method-function-save input-method-function))
          ad-do-it
          (setq input-method-function input-method-function-save)
          (key-chord-mode (if current-input-method 0 1))))

      ;こっから定義
      (setq key-chord-two-keys-delay 0.04)
      (key-chord-mode 1)
      (key-chord-define-global "jk" 'view-mode)
      ;; yu で auto-complete-modeの有効/無効を切り替える
      (key-chord-define-global "ac" 'auto-complete-mode)
      ;; 分割したウィンドウを移動(上下左右)
      (key-chord-define-global "uw" 'windmove-up)
      (key-chord-define-global "dw" 'windmove-down)
      (key-chord-define-global "lw" 'windmove-left)
      (key-chord-define-global "rw" 'windmove-right)
      ;; fg で keyboard-escape-quit する
      ;(key-chord-define-global "fg" 'keyboard-escape-quit)
      ;; バッファ切り替え
      (key-chord-define-global "pb" 'previous-buffer)
      (key-chord-define-global "bw" 'backward-buffer)
      ;; バッファリスト
      (key-chord-define-global "bl" 'electric-buffer-list)
      ;; バッファ先頭/末尾へのカーソル移動
      (key-chord-define-global "bg" 'beginning-of-buffer)
      (key-chord-define-global "ed" 'end-of-buffer)
      ;; アンドゥ/リドゥ
      (key-chord-define-global "ud" 'undo)
      (key-chord-define-global "re" 'redo)
      ;; ファイルを開く
      (key-chord-define-global "of" 'find-file)
      ;; スクロール
      (key-chord-define-global "su" 'scroll-down)
      (key-chord-define-global "sd" 'scroll-up)
      ;; 
      (key-chord-define-global "ro" 'other-window)
      (key-chord-define-global "ns" 'elscreen-next)
      (key-chord-define-global "os" 'elscreen-create)
      (key-chord-define-global "df" 'delete-frame)
      (key-chord-define-global "sm" 'set-mark-command)
      (key-chord-define-global "sa" 'mark-whole-buffer)
      (key-chord-define-global "kb" 'kill-buffer)
      (key-chord-define-global "ks" 'elscreen-kill)
      (key-chord-define-global "j0" 'elscreen-jump-0)
      (key-chord-define-global "js" 'elscreen-jump)
      (key-chord-define-global "j9" 'elscreen-jump-9)
      (key-chord-define-global "sh" 'split-window-vertically)
      (key-chord-define-global "sv" 'split-window-horizontally)
      (key-chord-define-global "dw" 'delete-window)
      ;;matlab
      (key-chord-define-global "om" 'matlab-shell)
      ;;ecb
      (key-chord-define-global "gu" 'ecb-goto-window-directories)
      (key-chord-define-global "gj" 'ecb-goto-window-sources)
      (key-chord-define-global "gh" 'ecb-goto-window-history)
      (key-chord-define-global "gk" 'ecb-goto-window-edit1)
      (key-chord-define-global "g," 'ecb-goto-window-edit2)
      (key-chord-define-global "gm" 'ecb-goto-window-methods)
      ;;code
      (key-chord-define-global ",." "<>\C-b" )
      (key-chord-define-global "90" "()\C-b" )
;      (key-chord-define-global "d;" "'""\C-b" )

      ;;howm
      (key-chord-define-global "ho" 'howm-menu )
      (key-chord-define-global "id" 'my-get-date)
      (key-chord-define-global "hc" 'howm-create )
      (key-chord-define-global "ha" 'howm-list-all )
      (key-chord-define-global "if" "file://" )
      (key-chord-define-global "ic" "<<<" )      
      (key-chord-define-global "ig" ">>>" )
      (key-chord-define-global "it" 'table-insert )
      (key-chord-define-global "ut" 'table-unrecognize-table )
      (key-chord-define-global "rt" 'table-recognize-table )
      (key-chord-define-global "tv" 'table-split-cell-vertically )
      (key-chord-define-global "th" 'table-split-cell-horizontally )
      (key-chord-define-global "ts" 'table-span-cell )

      ;;yatex
      (key-chord-define-global "ym" 'yatex-mode )

      ;;multi-term
      (key-chord-define-global "mt" 'multi-term )

      ;twittering-mode
      (key-chord-define-global "tw" 'twittering-update-status-interactive )
      (key-chord-define-global "tm" 'twittering-mode )      

))