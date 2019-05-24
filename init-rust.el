
(use-package rust-mode
  :ensure t
  :init
  (add-hook 'rust-mode-hook #'lsp)
  :config
  (modify-syntax-entry ?_ "w" rust-mode-syntax-table))

(provide 'init-rust)
