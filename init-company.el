(use-package company                    ; Graphical (auto-)completion
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
        company-tooltip-flip-when-above t)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map [tab] 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  :diminish company-mode
)

(use-package company-quickhelp          ; Show help in tooltip
  :ensure t
  :after company
  :init (company-quickhelp-mode))

(use-package company-statistics         ; Sort company candidates by statistics
  :ensure t
  :after company
  :init (company-statistics-mode))

(use-package helm-company               ; Helm frontend for company
  :ensure t
  :defer t
  :after company helm
  :init ;; Use Company for completion
  ;(bind-key [remap completion-at-point] #'helm-company company-mode-map)
  (bind-key "C-;" #'helm-company company-mode-map)
  (bind-key "C-;" #'helm-company company-active-map))

(provide 'init-company)
