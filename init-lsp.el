
(use-package lsp-mode
 :ensure t
 :init (setq lsp-prefer-flymake nil))

(use-package lsp-ui
  :ensure t
  :config
  (progn
    (setq lsp-ui-sideline-enable nil)
    (setq lsp-ui-doc-position 'at-point)
  )
  :hook (lsp-mode . lsp-ui-mode))

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(provide 'init-lsp)
