;;matlab

;; for Matlab  
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)  
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)  
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))

(add-to-list 'load-path "~/.emacs.d/elisp/matlab.el")
(load-library "matlab-load")
;; Enable CEDET feature support for MATLAB code. (Optional)
(matlab-cedet-setup)

(setq matlab-mode-install-path  
      (list  
       (expand-file-name "~/Dropbox/Matlab/")  
       (expand-file-name "~/Dropbox/Matlab/Common/")  
       (expand-file-name "~/Dropbox/Matlab/fnc/")  
       )  
      )  

;;mlint
(autoload 'mlint-minor-mode "mlint" nil t)  
(add-hook 'matlab-mode-hook (lambda () (mlint-minor-mode 1)))  
;(setq matlab-show-mlint-warnings t  
;      mlint-programs '("/Applications/MATLAB_R2009aSV.app/bin/maci/mlint"
;		       )  
;;after graduate
;

(global-set-key "\C-zm" 'matlab-shell)