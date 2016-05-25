(use-package magit
  :ensure t
  :bind (("<f12>" . magit-status))
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

(provide 'init-git)
