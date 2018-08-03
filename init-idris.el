(use-package idris-mode
  :ensure t
  :defer t
  :after company
  :config
  (idris-define-evil-keys)
)

(provide 'init-idris)
