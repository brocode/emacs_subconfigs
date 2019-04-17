
(use-package lsp-mode
 :ensure t
 :init (setq lsp-prefer-flymake nil))

(use-package lsp-ui
  :ensure t
  :config
  (progn
    (setq lsp-ui-sideline-enable nil)
    (setq lsp-ui-doc-position 'at-point)
    (evil-define-key 'normal lsp-ui-mode-map (kbd "C-]") 'evil-goto-definition)
    (evil-define-key 'normal lsp-ui-mode-map (kbd "C-c d") (lambda () (interactive) (progn
                                                                                 (if lsp-ui-doc-mode (lsp-ui-doc-mode -1)
                                                                                   (lsp-ui-doc-mode))
                                                                                 (lsp-ui-doc-hide)))))
  :hook (lsp-mode . lsp-ui-mode))

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(provide 'init-lsp)
