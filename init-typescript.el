(use-package typescript-mode
  :ensure t
  :defer t)

(use-package tide
  :ensure t
  :after typescript-mode company
  :init
  (progn
    (defun setup-tide-mode ()
      (tide-setup)
      (flycheck-mode +1)
      (eldoc-mode +1)
      (tide-hl-identifier-mode +1))

    ;; formats the buffer before saving
    ;(add-hook 'before-save-hook 'tide-format-before-save)

    (add-hook 'typescript-mode-hook #'setup-tide-mode))
  :config
  (progn
    (define-key typescript-mode-map (kbd "C-]") 'tide-jump-to-definition)
    (define-key typescript-mode-map (kbd "M-d") 'tide-jump-to-definition)
    ))

(provide 'init-typescript)
