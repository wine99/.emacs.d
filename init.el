(defconst *is-windows*
  (or (eq system-type 'ms-dos)
      (eq system-type 'windows-nt)))

(setq make-backup-files nil)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)

(show-paren-mode 1)

(set-face-attribute 'default nil :font (font-spec :family "Fira Code" :size 16))

(when *is-windows*
  (set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "Microsoft YaHei" :size 16)))

(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;(setq package-archives
;      '(("gnu" . "https://elpa.gnu.org/packages/")
;	("melpa" . "https://melpa.org/packages/")))

(setq package-check-signature nil)
(require 'package)

(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(require 'upackage)

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode.exe locate")))
