(use-package company                    ; Graphical (auto-)completion
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
        company-tooltip-flip-when-above t)
  (define-key company-active-map (kbd "C-w") #'backward-kill-word)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map [tab] #'company-complete-selection)
  (define-key company-active-map (kbd "TAB") #'company-complete-selection)
  (define-key global-map (kbd "C-c .") 'company-files)
  (define-key company-mode-map [remap indent-for-tab-command] 'company-indent-for-tab-command)

  (setq tab-always-indent 'complete
        company-dabbrev-ignore-case nil
        company-dabbrev-code-ignore-case nil
        company-dabbrev-downcase nil
  )

  (defvar completion-at-point-functions-saved nil)

  (defun company-indent-for-tab-command (&optional arg)
    (interactive "P")
    (let ((completion-at-point-functions-saved completion-at-point-functions)
          (completion-at-point-functions '(company-complete-common-wrapper)))
      (indent-for-tab-command arg)))

  (defun company-complete-common-wrapper ()
    (let ((completion-at-point-functions completion-at-point-functions-saved))
      (company-complete-common)))
  :diminish company-mode
  )

(use-package company-quickhelp          ; Show help in tooltip
  :ensure t
  :after company
  :init
  (if (not (eq system-type 'darwin))
    (company-quickhelp-mode 1)
  )
)

(use-package company-statistics         ; Sort company candidates by statistics
  :ensure t
  :after company
  :init (add-hook 'after-init-hook 'company-statistics-mode))

(use-package helm-company               ; Helm frontend for company
  :ensure t
  :defer t
  :after company helm
  :init ;; Use Company for completion
                                        ;(bind-key [remap completion-at-point] #'helm-company company-mode-map)
  (bind-key "C-;" #'helm-company company-mode-map)
  (bind-key "C-;" #'helm-company company-active-map))

(provide 'init-company)
