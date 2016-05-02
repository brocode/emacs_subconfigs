(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :defer t
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/subconfigs/snippets" yas-installed-snippets-dir))

  (yas-global-mode 1))

(provide 'init-yasnippet)
