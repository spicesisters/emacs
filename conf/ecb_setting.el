;;ecb
(setq load-path (cons (expand-file-name "~/.emacs.d/elisp/ecb-2.40") load-path))
(load-file "~/.emacs.d/elisp/cedet-1.0pre6/common/cedet.el") ;;パスは適宜
(setq semantic-load-turn-useful-things-on t)
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 

(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-windows-width 0.25)
(defun ecb-toggle ()
  (interactive)
  (if ecb-minor-mode
      (ecb-deactivate)
    (ecb-activate)))
(global-set-key [f2] 'ecb-toggle)
