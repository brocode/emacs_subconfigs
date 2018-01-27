(use-package typescript-mode
  :ensure t
  :init
  :config
  )

(use-package tide
  :ensure t
  :init
  (progn
    (defun setup-tide-mode ()
      (tide-setup)
      (flycheck-mode +1)
      (eldoc-mode +1)
      (local-set-key (kbd "C-]") 'tide-jump-to-definition)
      (local-set-key (kbd "M-d") 'tide-jump-to-definition)
      (local-set-key (kbd "M-i") 'tide-fix)
      (tide-hl-identifier-mode +1))

    ;; formats the buffer before saving
    ;(add-hook 'before-save-hook 'tide-format-before-save)

    (add-hook 'typescript-mode-hook #'setup-tide-mode))
    (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode))))
  :config
  (progn
    (setq typescript-indent-level 2)
    (evil-set-command-property 'tide-jump-to-definition :jump t)
    ))

(provide 'init-typescript)
