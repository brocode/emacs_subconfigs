(use-package elixir-mode
  :ensure t)

(use-package alchemist
  :ensure t
  :config
    (define-key alchemist-mode-map (kbd "C-]") 'alchemist-goto-definition-at-point)
    (define-key alchemist-mode-map (kbd "C-d") 'alchemist-goto-definition-at-point))

(provide 'init-elixir)
