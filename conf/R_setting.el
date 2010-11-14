;;R
(load "~/.emacs.d/elisp/ess-5.5/lisp/ess-site")
(setq auto-mode-alist
     (cons (cons "\\.r$" 'R-mode) auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)
(global-font-lock-mode t)                                        ; S/R   TeX
;(set-face-foreground 'font-lock-comment-face       "Firebrick")  ; #com  %com
;(set-face-foreground 'font-lock-string-face         "SeaGreen")  ; "str" "str"
;(set-face-foreground 'font-lock-keyword-face      "MediumBlue")  ; if    ¥end
(set-face-foreground 'font-lock-constant-face      "VioletRed")  ; fun<- {ctr}
;(set-face-foreground 'font-lock-type-face      "DarkGoldenrod")  ; T,F    ?
;(set-face-foreground 'font-lock-variable-name-face      "Blue")  ; xv
(set-face-foreground 'font-lock-function-name-face "VioletRed")  ; <-    {eq1}

;;日本語表示？
;(setq ess-pre-run-hook
;  '((lambda () (setq S-directory default-directory)
;               (setq default-process-coding-system '(euc-japan-mac .   euc-japan-mac))
;   )))

;(add-hook 'ess-mode-hook
;	  (lambda ()
;	    (define-key ess-mode-map "(" 'ess-r-args-auto-show)))
;(setq ess-r-args-show-as 'tooltip)

;(set-language-environment "Japanese")
;(set-default-coding-systems 'euc-japan-unix)
;(set-terminal-coding-system 'euc-japan-unix)
;(set-keyboard-coding-system 'euc-japan-unix)
;(set-buffer-file-coding-system 'euc-japan-unix)
;(require 'ess-site)
;(define-key ess-mode-map "\177"   'delete-char)
;(setq ess-ask-for-ess-directory nil)
;(setq ess-pre-run-hook
;  '((lambda () (setq S-directory default-directory)
;               (setq default-process-coding-system '(euc-japan-unix .   euc-japan-unix))
;   )))

;R japanese
;(set-locale-environment "utf-8")
;(setenv "LANG" "ja_JP.UTF-8")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;anything-c-source-R-helpの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq anything-c-source-R-help
      '((name . "R objects / help")
	(init . (lambda ()
		  ;; this grabs the process name associated with the buffer
		  (setq anything-c-ess-local-process-name ess-local-process-name)))
	(candidates . (lambda ()
			(condition-case nil
			    (ess-get-object-list anything-c-ess-local-process-name)
			  (error nil))))
	(action
	 ("help" . ess-display-help-on-object)
	 ("head (10)" . (lambda(obj-name)
			  (ess-execute (concat "head(" obj-name ", n = 10)\n") nil (concat "R head: " obj-name))))
	 ("head (100)" . (lambda(obj-name)
			   (ess-execute (concat "head(" obj-name ", n = 100)\n") nil (concat "R head: " obj-name))))
	 ("tail" . (lambda(obj-name)
		     (ess-execute (concat "tail(" obj-name ", n = 10)\n") nil (concat "R tail: " obj-name))))
	 ("str" . (lambda(obj-name)
		    (ess-execute (concat "str(" obj-name ")\n") nil (concat "R str: " obj-name))))
	 ("summary" . (lambda(obj-name)
			(ess-execute (concat "summary(" obj-name ")\n") nil (concat "R summary: " obj-name))))
	 ("view source" . (lambda(obj-name)
			    (ess-execute (concat "print(" obj-name ")\n") nil (concat "R object: " obj-name))))
	 ("dput" . (lambda(obj-name)
		     (ess-execute (concat "dput(" obj-name ")\n") nil (concat "R dput: " obj-name)))))
	(volatile)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; anything-c-source-R-localの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq anything-c-source-R-local
      '((name . "R local objects")
	(init . (lambda ()
		  ;; this grabs the process name associated with the buffer
		  (setq anything-c-ess-local-process-name ess-local-process-name)
		  ;; this grabs the buffer for later use
		  (setq anything-c-ess-buffer (current-buffer))))
	(candidates . (lambda ()
			(let (buf)
			  (condition-case nil
			      (with-temp-buffer
				(progn
				  (setq buf (current-buffer))
				  (with-current-buffer anything-c-ess-buffer
				    (ess-command "print(ls.str(), max.level=0)\n" buf))
				  (split-string (buffer-string) "\n" t)))
			    (error nil)))))
	(display-to-real . (lambda (obj-name) (car (split-string obj-name " : " t))))
	(action
	 ("str" . (lambda(obj-name)
		    (ess-execute (concat "str(" obj-name ")\n") nil (concat "R str: " obj-name))))
	 ("summary" . (lambda(obj-name)
			(ess-execute (concat "summary(" obj-name ")\n") nil (concat "R summary: " obj-name))))
	 ("head (10)" . (lambda(obj-name)
			  (ess-execute (concat "head(" obj-name ", n = 10)\n") nil (concat "R head: " obj-name))))
	 ("head (100)" . (lambda(obj-name)
			   (ess-execute (concat "head(" obj-name ", n = 100)\n") nil (concat "R head: " obj-name))))
	 ("tail" . (lambda(obj-name)
		     (ess-execute (concat "tail(" obj-name ", n = 10)\n") nil (concat "R tail: " obj-name))))
	 ("print" . (lambda(obj-name)
		      (ess-execute (concat "print(" obj-name ")\n") nil (concat "R object: " obj-name))))
	 ("dput" . (lambda(obj-name)
		     (ess-execute (concat "dput(" obj-name ")\n") nil (concat "R dput: " obj-name)))))
	(volatile)))
