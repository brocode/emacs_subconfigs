
(use-package rust-mode
  :ensure t
  :init
  (add-hook 'rust-mode-hook #'lsp)
  (add-to-list 'auto-mode-alist '("\\.toml\\'" . conf-mode))
)

(provide 'init-rust)
