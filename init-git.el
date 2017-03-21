(use-package magit
  :ensure t
  :init
  (define-key global-map (kbd "<f12>") 'magit-status)
  :config
  (define-key magit-status-mode-map (kbd "<f12>") 'magit-mode-bury-buffer)
  )

(use-package gitignore-mode
  :ensure t)

(use-package gitconfig-mode
  :ensure t)

(use-package diff-hl
  :ensure t
  :defer t
  :after magit
  :if window-system
  :config
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package evil-magit
  :after magit
  :ensure t
  :init
  (evil-magit-init))

(provide 'init-git)
