
(use-package rust-mode
  :ensure t
  :init
  (add-hook 'rust-mode-hook #'lsp))

(provide 'init-rust)
