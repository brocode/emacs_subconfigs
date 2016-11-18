(use-package purescript-mode            ; PureScript mode
  :ensure t
  :pin emacs-pe)

(use-package psci                       ; psci integration
  :ensure t
  :pin emacs-pe)

(use-package psc-ide
  :ensure t
  :after purescript-mode
  :init
  (add-hook 'purescript-mode-hook
            (lambda ()
              (psc-ide-mode)
              (company-mode)
              (flycheck-mode)
              (turn-on-purescript-indentation))))

(provide 'init-purescript)
