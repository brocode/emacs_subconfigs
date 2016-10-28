(use-package json-mode
  :ensure t
  :defer t
  :after flycheck-mode flyspell-mode
  :config
  (add-hook 'json-mode-hook 'flycheck-mode)
  (add-hook 'json-mode-hook 'flyspell-mode-off)
  (define-key json-mode-map (kbd "M-f") 'json-pretty-print-buffer)
  )

(provide 'init-json)
