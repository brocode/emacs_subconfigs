
(use-package ensime
  :ensure t
  :defer t
  :after company scala
  :init
  (setenv "PATH" (concat "/usr/local/bin/:" (getenv "PATH")))
  (add-hook 'java-mode-hook 'ensime-scala-mode-hook)
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
  (setq ensime-completion-style 'company)
  (setq ensime-use-helm t)

  :config
  (define-key ensime-mode-map (kbd "M-t") 'ensime-inspect-type-at-point)
  (define-key ensime-mode-map (kbd "M-r") 'ensime-refactor-diff-rename)
  (define-key ensime-mode-map (kbd "M-o") 'ensime-refactor-diff-organize-imports)
  (define-key ensime-mode-map (kbd "M-f") 'ensime-format-source)
  (define-key ensime-mode-map (kbd "M-c") 'ensime-typecheck-current-buffer)
  (define-key ensime-mode-map (kbd "M-e") 'ensime-print-errors-at-point)
  (define-key ensime-mode-map (kbd "M-E") 'ensime-show-all-errors-and-warnings)
  (define-key ensime-mode-map (kbd "M-d") 'ensime-edit-definition)
  (define-key ensime-mode-map (kbd "M-i") 'ensime-import-type-at-point)
  (define-key ensime-mode-map (kbd "M-a") 'ensime-refactor-add-type-annotation)

  (evil-define-key 'insert ensime-mode-map (kbd "C-n") 'company-select-next)
  (evil-define-key 'insert ensime-mode-map (kbd "C-p") 'company-select-previous)
  (evil-define-key 'normal ensime-mode-map (kbd "C-]") 'ensime-edit-definition)
  (evil-define-key 'normal ensime-mode-map (kbd "M-d") 'ensime-edit-definition)

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



