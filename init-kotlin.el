(use-package kotlin-mode
  :ensure t
  :init
  (progn
    (add-hook 'kotlin-mode-hook #'lsp)))


(provide 'init-kotlin)
