(use-package ensime
  :defer t
  :ensure t
  ;:load-path "/home/phaun/development/projects/ensime-emacs"
  ;:after company scala
  :init
  (setenv "PATH" (concat "/usr/local/bin/:" (getenv "PATH")))
  (add-hook 'java-mode-hook 'ensime-scala-mode-hook)
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
  (setq ensime-completion-style 'company)
  (setq ensime-use-helm t)
  (setq ensime-search-interface 'helm)
  (setq ensime-startup-snapshot-notification nil)
  (setq ensime-startup-snapshot-notification-3 nil)
  (setq ensime-startup-notification nil)

  :config
  (define-key ensime-mode-map (kbd "M-t") 'ensime-type-at-point-full-name)
  (define-key ensime-mode-map (kbd "M-r") 'ensime-refactor-diff-rename)
  (define-key ensime-mode-map (kbd "M-o") 'ensime-refactor-diff-organize-imports)
  (define-key ensime-mode-map (kbd "M-f") 'ensime-format-source)
  (define-key ensime-mode-map (kbd "M-s") 'ensime-search)
  (define-key ensime-mode-map (kbd "M-c") 'ensime-typecheck-current-buffer)
  (define-key ensime-mode-map (kbd "M-e") 'ensime-print-errors-at-point)
  (define-key ensime-mode-map (kbd "M-E") 'ensime-show-all-errors-and-warnings)
  (define-key ensime-mode-map (kbd "M-d") 'ensime-edit-definition)
  (define-key ensime-mode-map (kbd "M-i") 'ensime-import-type-at-point)
  (define-key ensime-mode-map (kbd "M-a") 'ensime-refactor-add-type-annotation)
  (define-key ensime-mode-map (kbd "C-]") 'ensime-edit-definition)
  (define-key ensime-mode-map (kbd "M-d") 'ensime-edit-definition)
  (define-key ensime-mode-map (kbd "M-g") 'ensime-show-uses-of-symbol-at-point)
  (define-key ensime-mode-map (kbd "M-h") 'ensime-show-hierarchy-of-type-at-point)

  (evil-define-key 'insert ensime-mode-map (kbd "C-n") 'company-select-next)
  (evil-define-key 'insert ensime-mode-map (kbd "C-p") 'company-select-previous)

  (evil-set-command-property 'ensime-edit-definition :jump t)

  (evil-define-key 'normal ensime-refactor-info-map (kbd "c") (lambda()(interactive)
                              (funcall continue-refactor)
                              (ensime-popup-buffer-quit-function)
                              ))
  (evil-define-key 'normal ensime-refactor-info-map (kbd "q") (lambda()(interactive)
                              (funcall cancel-refactor)
                              (ensime-popup-buffer-quit-function)
                              ))

  (evil-define-key 'normal ensime-inspector-mode-map (kbd "q") 'ensime-popup-buffer-quit-function)


  (evil-define-key 'insert ensime-search-mode-map (kbd "C-n") 'ensime-search-next-match)
  (evil-define-key 'insert ensime-search-mode-map (kbd "C-p") 'ensime-search-prev-match)
  (evil-define-key 'insert ensime-search-mode-map (kbd "RET") 'ensime-search-choose-current-result)
  (evil-define-key 'insert ensime-search-mode-map (kbd "M-i") 'ensime-search-insert-import-of-current-result)
)

(provide 'init-ensime)
