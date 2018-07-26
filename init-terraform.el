(use-package terraform-mode
  :ensure t)

(use-package company-terraform
  :init (company-terraform-init)
  :after terraform-mode
  :ensure t)

(provide 'init-terraform)
