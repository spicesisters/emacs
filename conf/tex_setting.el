;;yatex
;;(cond
; ((locate-library "yatex")
;  (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)


   (setq YaTeX-kanji-code 1)           ; 漢字コードを shift jis に
;  (setq tex-command "platex")         ; tex の実行コマンド
;  (setq dvi2-command "dviout")        ; プレビューアのコマンド
   (setq bibtex-command "jbibtex")     ; BibTeX のコマンド
;  (setq section-name "documentclass") ; LaTeX2e では documentclass を使うのが標準
;  (setq YaTeX-nervous nil)            ; 辞書はユーザ辞書でよいと思う

  ; yatex ロード時の設定
 ; (add-hook 'yatex-mode-load-hook
;            (function
;             (lambda ()
               ; 日本語入力中でもタイプセットできるように 
;               (wrap-function-to-control-ime 'YaTeX-typeset-menu t "P"))))))



;;プレビュアの設定
;(defvar YaTeX-dvi2-command-ext-alist
 ; '(("xdvi" . ".dv i")
;    ("ghostview¥¥|gv" . ".ps")
;    ("acroread¥¥|pdf¥¥|Preview¥¥|TeXShop¥¥|Skim" . ".pdf")))


;;Tex
(setq auto-mode-alist
(cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq tex-command "~/Library/TeXShop/bin/platex2pdf-utf8" dvi2-command "open -a Skim")

;reftex-mode
(add-hook 'yatex-mode-hook
          #'(lambda ()
              (reftex-mode 1)
              (define-key reftex-mode-map
                (concat YaTeX-prefix ">") 'YaTeX-comment-region)
              (define-key reftex-mode-map
                (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))
