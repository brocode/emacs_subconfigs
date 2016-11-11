(use-package haskell-mode               ; Haskell major mode
  :ensure t
  :defer t
  :bind (:map haskell-mode-map
              ("M-d" . haskell-mode-jump-to-def-or-tag))
  :config
  (setq haskell-tags-on-save t ; Regenerate TAGS on save
        haskell-process-log t  ; Show log for GHCI process
        ;; Remove unused imports and auto-import modules
        haskell-process-suggest-remove-import-lines t
        haskell-process-auto-import-loaded-modules t)

  (add-hook 'haskell-mode-hook (lambda () (ghc-init)))
  (add-hook 'haskell-mode-hook #'haskell-decl-scan-mode) ; IMenu support
  (add-hook 'haskell-mode-hook #'interactive-haskell-mode))

(use-package flycheck-haskell
  :ensure t
  :after flycheck haskell-mode
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)
  )


(use-package cabal-mode                 ; Cabal files
  :ensure haskell-mode
  :defer t
  :bind (:map haskell-cabal-mode-map
              ("C-`" . haskell-interactive-bring)
              ("C-c C-k" . haskell-interactive-mode-clear)
              ("C-c C-c" . haskell-process-cabal-build)
              ("C-c c" . haskell-process-cabal)))

(use-package company-ghc
  :ensure t
  :init
  (add-to-list 'company-backends 'company-ghc)
  (setq company-ghc-show-info t))

(use-package hindent                    ; Haskell indentation
  :after haskell-mode
  :ensure t
  :init
  (add-hook 'haskell-mode-hook #'hindent-mode))

(provide 'init-haskell)
