(use-package rainbow-mode
  :ensure t
  :diminish rainbow-mode
  :init
  (add-hook 'css-mode-hook #'rainbow-mode)
  (add-hook 'less-mode-hook #'rainbow-mode)
)

(provide 'init-rainbow-mode)
