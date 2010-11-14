;;howm
(setq howm-menu-lang 'ja)
(require 'howm-mode)
(setq howm-directory "~/Dropbox/howm/")
(setq howm-keyword-file "~/Dropbox/howm/.howm-keys") 

(setq howm-view-external-viewer-assoc      '(
					     ("[.]\\(pdf\\)$" . "open -a Skim %s")
        ))

;; *.howm を outline-mode に
(add-to-list 'auto-mode-alist '("\\.howm$" . outline-mode))
(add-hook 'howm-mode-hook
          (function
           (lambda ()
             (progn
               (setq outline-heading-alist ; =で始まる行を最上位にする
                     '(("=" . 1) ("*" . 2) ("**" . 3)
                       ("***" . 4) ("****" . 5)))
               (setq outline-regexp
                     (concat "[*=]+")
                     )))))
