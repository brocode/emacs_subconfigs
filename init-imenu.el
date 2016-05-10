(use-package popup-imenu
  :ensure t
  :defer t
  :after evil
  :config
  :bind(
    ("C-c C-p i" . popup-imenu)))

(provide 'init-imenu)
