(use-package go-mode
  :ensure t
  :defer t
  :bind (:map go-mode-map
        ("M-t" . godef-describe)
        ("C-]" . godef-jump)
        ("M-d" . godef-jump))
  :init
  (progn
    (when (not (getenv "GOPATH")) (setenv "GOPATH" (expand-file-name "~/go/")))
    (add-hook 'go-mode-hook #'flycheck-mode)
    (setq godef-command (expand-file-name "~/go/bin/godef"))))

(use-package company-go
  :ensure t
  :after go-mode
  :init
  (progn
    (setq company-go-gocode-command (expand-file-name "~/go/bin/gocode"))
    (add-hook 'go-mode-hook (lambda ()
                              (set (make-local-variable 'company-backends) '(company-go))))))


(provide 'init-go)
