(use-package python-mode
  :ensure t
  :init
  (add-hook 'python-mode-hook #'lsp))   ; sudo pip install python-language-server[all]

(provide 'init-python)
