(use-package json-mode
  :ensure t
  :defer t
  :after flycheck-mode
  :config
  (add-hook 'json-mode-hook 'flycheck-mode)
  )

(provide 'init-json)
