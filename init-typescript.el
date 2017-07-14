(use-package typescript-mode
  :ensure t
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.tsx$" . typescript-mode)))

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
    (setq typescript-indent-level 2)
    (define-key typescript-mode-map (kbd "C-]") 'tide-jump-to-definition)
    (evil-set-command-property 'tide-jump-to-definition :jump t)
    (define-key typescript-mode-map (kbd "M-d") 'tide-jump-to-definition)
    ))

(provide 'init-typescript)
