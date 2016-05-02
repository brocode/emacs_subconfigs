(use-package paradox
  :ensure t
  :defer t
  :config
  (setq paradox-github-token t)
  (evil-define-key 'normal paradox-menu-mode-map (kbd "M-l") 'paradox-menu-view-commit-list))

(provide 'init-paradox)
