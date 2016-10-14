(use-package company                    ; Graphical (auto-)completion
  :ensure t
  :init (global-company-mode)
  :after yasnippet
  :config (progn
            (require 'yasnippet)
            (setq company-tooltip-align-annotations t
                  company-tooltip-flip-when-above t)
            (define-key company-active-map (kbd "C-w") #'backward-kill-word)
            (define-key company-active-map (kbd "C-n") #'company-select-next)
            (define-key company-active-map (kbd "C-p") #'company-select-previous)
            (define-key global-map (kbd "C-c .") 'company-files)

            (setq tab-always-indent 'complete
                  company-dabbrev-ignore-case nil
                  company-dabbrev-code-ignore-case nil
                  company-dabbrev-downcase nil
                  )
            (defun check-expansion ()
              (save-excursion
                (if (looking-at "\\_>") t
                  (backward-char 1)
                  (if (looking-at "\\.") t
                    (backward-char 1)
                    (if (looking-at "->") t nil)))))

            (defun do-yas-expand ()
              (let ((yas/fallback-behavior 'return-nil))
                (yas/expand)))

            (defun tab-indent-or-complete ()
              (interactive)
              (cond
               ((minibufferp)
                (minibuffer-complete))
               (t
                (indent-for-tab-command)
                (if (or (not yas/minor-mode)
                        (null (do-yas-expand)))
                    (if (check-expansion)
                        (progn
                          (company-manual-begin)
                          (if (null company-candidates)
                              (progn
                                (company-abort)
                                (indent-for-tab-command)))))))))

            (defun tab-complete-or-next-field ()
              (interactive)
              (if (or (not yas/minor-mode)
                      (null (do-yas-expand)))
                  (if company-candidates
                      (company-complete-selection)
                    (if (check-expansion)
                        (progn
                          (company-manual-begin)
                          (if (null company-candidates)
                              (progn
                                (company-abort)
                                (yas-next-field))))
                      (yas-next-field)))))

            (defun expand-snippet-or-complete-selection ()
              (interactive)
              (if (or (not yas/minor-mode)
                      (null (do-yas-expand))
                      (company-abort))
                  (company-complete-selection)))

            (defun abort-company-or-yas ()
              (interactive)
              (if (null company-candidates)
                  (yas-abort-snippet)
                (company-abort)))

            ;(global-set-key [tab] 'tab-indent-or-complete)
            ;(global-set-key (kbd "TAB") 'tab-indent-or-complete)
            (global-set-key [(control return)] 'company-complete-common)

            (define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
            (define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)

            (define-key yas-minor-mode-map [tab] nil)
            (define-key yas-minor-mode-map (kbd "TAB") nil)

            (define-key yas-keymap [tab] 'tab-complete-or-next-field)
            (define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
            (define-key yas-keymap [(control tab)] 'yas-next-field)
            (define-key yas-keymap (kbd "C-g") 'abort-company-or-yas))

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
