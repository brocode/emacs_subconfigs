(use-package groovy-mode
  :ensure t
  :init
    (setq groovy-indent-offset 2)
    (add-hook 'groovy-mode-hook #'lsp))

(provide 'init-groovy)
