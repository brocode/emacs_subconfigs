
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-prefer-flymake nil)
  (setq lsp-completion-provider :capf))

(use-package lsp-ui
  :ensure t
  :config
  (progn
    (setq lsp-ui-sideline-enable nil)
    (setq lsp-ui-doc-position 'bottom)
    (evil-define-key 'normal lsp-ui-mode-map (kbd "C-]") 'lsp-find-definition)
    (evil-define-key 'normal lsp-ui-mode-map (kbd "M-d") 'lsp-find-definition)
    (evil-define-key 'normal lsp-ui-mode-map (kbd "C-c d") (lambda () (interactive) (progn
                                                                                 (if lsp-ui-doc-mode (lsp-ui-doc-mode -1)
                                                                                   (lsp-ui-doc-mode))
                                                                                 (lsp-ui-doc-hide)))))
  :hook (lsp-mode . lsp-ui-mode))


(provide 'init-lsp)
