(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-always-defer t)
(setq use-package-always-demand nil)
(setq use-package-verbose t)
;; (setq use-package-expand-minimally t)

(use-package highlight-parentheses
  :ensure t)

(use-package racket-mode)

(use-package haskell-mode)

(use-package company)

(use-package paredit
  :ensure t
  :config
  (dolist (m '(emacs-lisp-mode-hook
	       racket-mode-hook
	       racket-repl-mode-hook))
    (add-hook m #'paredit-mode))
  (bind-keys :map paredit-mode-map
	     ("{" . paredit-open-curly)
	     ("}" . paredit-close-curly))
  (unless terminal-frame
    (bind-keys :map paredit-mode-map
	       ("M-[" . paredit-wrap-square)
	       ("M-{" . paredit-wrap-curly))))

;(use-package vscode-dark-plus-theme
;  :ensure t
;  :config
;  (load-theme 'vscode-dark-plus t))

(provide 'upackage)
