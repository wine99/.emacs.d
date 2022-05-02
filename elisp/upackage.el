(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-verbose t)
;; (setq use-package-always-defer t)
;; (setq use-package-always-demand t)
;; (setq use-package-expand-minimally t)


(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode)
  (evil-set-undo-system 'undo-redo))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))


(use-package vertico
  :config
  (vertico-mode))

(use-package orderless
  :config
  (setq completion-styles '(orderless)))

(use-package marginalia
  :config
  (marginalia-mode))

(use-package rainbow-mode)

(use-package which-key
  :config
  (which-key-mode))


(use-package treemacs)
(use-package treemacs-evil)

(use-package winum
  :config
  (global-set-key (kbd "M-0") 'treemacs-select-window)
  (global-set-key (kbd "M-1") 'winum-select-window-1)
  (global-set-key (kbd "M-2") 'winum-select-window-2)
  (global-set-key (kbd "M-3") 'winum-select-window-3)
  (global-set-key (kbd "M-4") 'winum-select-window-4)
  (global-set-key (kbd "M-5") 'winum-select-window-5)
  (winum-mode))


(use-package ligature
  :ensure nil
  :load-path "ligature.el"
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures
   'prog-mode
   '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
     "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^="
     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
     "=<<" "=/=" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
     "<*>" "<|" "<|>" "<!--" "<-" "<--" "<->" "<+"
     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"
     ;; "$>" "<$" "<$>" "-<" ">-"
     ))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(use-package vscode-dark-plus-theme
  :config
  (load-theme 'vscode-dark-plus t))


(use-package magit)

(use-package git-gutter)

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))


(use-package lsp-mode
  :config
  (lsp-enable-which-key-integration t))

(use-package company
  :hook
  ((emacs-lisp-mode . (lambda ()
			(setq-local company-backends '(company-elisp))))
   (emacs-lisp-mode . company-mode))
  :config
  ;; (company-keymap--unbind-quick-access company-active-map)
  ;; (company-tng-configure-default)
  (setq company-idle-delay 0.2
	company-minimum-prefix-length 2))

(use-package racket-mode
  :defer t)

(use-package highlight-parentheses
  :hook
  ((emacs-lisp-mode . highlight-parentheses-mode)))

(use-package haskell-mode
  :defer t)

(use-package paredit
  :config
  (dolist (m '(emacs-lisp-mode-hook
	       racket-mode-hook
	       racket-repl-mode-hook))
    (add-hook m #'paredit-mode)))

(provide 'upackage)
