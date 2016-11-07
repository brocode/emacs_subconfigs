(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :defer t
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/subconfigs/snippets" yas-installed-snippets-dir))
  (define-key yas-minor-mode-map [(tab)]        nil)
  (define-key yas-minor-mode-map (kbd "TAB")    nil)
  (define-key yas-minor-mode-map (kbd "<tab>")  nil)
  (define-key yas-minor-mode-map (kbd "C-SPC")  'yas-next-field-or-maybe-expand)
  (define-key yas-keymap [(tab)] nil)
  (define-key yas-keymap [(backtab)] nil)
  (define-key yas-keymap (kbd "TAB") nil)
  (define-key yas-keymap (kbd "<tab>") nil)
  (define-key yas-keymap (kbd "C-l") 'yas-next-field)
  (define-key yas-keymap (kbd "C-h") 'yas-prev-field)
  )

(provide 'init-yasnippet)
