(use-package json-mode
  :ensure t
  :defer t
  :after flycheck-mode flyspell-mode
  :config
  (add-hook 'json-mode-hook 'flycheck-mode)
  (add-hook 'json-mode-hook 'flyspell-mode-off)
  )

(provide 'init-json)
