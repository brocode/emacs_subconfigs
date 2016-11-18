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
              (flycheck-mode)
              (turn-on-purescript-indentation)))
  :config
  (define-key purescript-mode-map (kbd "M-d") 'psc-ide-goto-definition)
  (define-key purescript-mode-map (kbd "C-]") 'psc-ide-goto-definition)
  (define-key purescript-mode-map (kbd "M-i") 'psc-ide-add-import))

(provide 'init-purescript)
