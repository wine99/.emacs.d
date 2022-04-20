(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-verbose t)
;; (setq use-package-always-defer t)
;; (setq use-package-always-demand t)
;; (setq use-package-expand-minimally t)

(use-package highlight-parentheses)

(use-package racket-mode
  :defer t)

(use-package haskell-mode
  :defer t)

(use-package company)

(use-package paredit
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

(use-package ligature
  :ensure nil
  :load-path "ligature.el"
  :config
  ;; Enable the "www" ligature in every possible major mode
  ;(ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  ;(ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures
   ;'prog-mode
   't
   '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(use-package vscode-dark-plus-theme
  :config
  (load-theme 'vscode-dark-plus t))

(provide 'upackage)
