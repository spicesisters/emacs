;;ansi-term
(when window-system
  (setq
   term-default-fg-color "White"
   term-default-bg-color "Black"
   ansi-term-color-vector
        [unspecified "black" "#ff5555" "#55ff55" "#ffff55" "#5555ff"
         "#ff55ff" "#55ffff" "white"]))
;(add-hook 'term-mode-hook
 ;       (function
  ;        (lambda ()
;                (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")
;                (make-local-variable 'mouse-yank-at-point)
;                (make-local-variable 'transient-mark-mode)
;                (setq mouse-yank-at-point t)
;                (setq transient-mark-mode t)
;                (auto-fill-mode -1)
;        (setq tab-width 4)
;                (define-key term-mode-map "\C-i" 'term-dynamic-complete)
;                (define-key term-mode-map "\C-m" 'term-send-input)
;		(setq font-lock-mode nil)
;		)))


;(global-set-key "\C-x\C-v" '(lambda ()(interactive)(ansi-term "/bin/bash")))
(global-set-key "\C-x\C-v" 'eshell)

;;multi-term
(require 'multi-term)
(setq multi-term-program "/bin/bash")
