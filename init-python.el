(use-package company-jedi
  :ensure t
  :config
  (defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))

  (add-hook 'python-mode-hook 'my/python-mode-hook)
  (define-key jedi-mode-map (kbd "M-d") 'jedi:goto-definition)
  (define-key jedi-mode-map (kbd "C-]") 'jedi:goto-definition))

(provide 'init-python)
