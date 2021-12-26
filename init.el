(defconst *is-windows*
  (or (eq system-type 'ms-dos)
      (eq system-type 'windows-nt)))

(setq make-backup-files nil)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)

(show-paren-mode 1)

(set-face-attribute 'default nil :font (font-spec :family "SauceCodePro Nerd Font" :size 20))

(when *is-windows*
  (set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "Microsoft YaHei" :size 18)))

(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(setq package-check-signature nil)
(require 'package)

(add-to-list
 'load-path
 (expand-file-name (concat user-emacs-directory "elisp")))

(require 'upackage)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(highlight-parentheses use-package racket-mode pfuture hydra ht cfrs ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
