;; init.el --- Emacs configuration

;; Set OSX function key as Meta

;; INSTALL PACKAGES

;; --------------------------------------

(require 'package)
(add-to-list 'package-archives                                                                                                 
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))   
(add-to-list 'package-archives
       '("melpa" . "https://melpa.org/packages/") t)

;; activate all packages
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; define list of packages to install
(defvar myPackages
  '(better-defaults
    material-theme
    exec-path-from-shell
    elpy
    pyenv-mode))

;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:environment-root "jedi")


;; Use shell's $PATH
(exec-path-from-shell-copy-env "PATH")
(setq inhibit-startup-message t)   ;; hide the startup message
(load-theme 'material t)           ;; load material theme
(global-linum-mode  t)              ;; enable line numbers globally
(setq linum-format "%4d \u2502 ")  ;; format line number spacing
;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (pyenv-mode elpy exec-path-from-shell material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
