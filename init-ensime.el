
(require-package 'ensime)

(setenv "PATH" (concat "/usr/local/bin/:" (getenv "PATH")))

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(require 'evil)

(define-key ensime-mode-map (kbd "M-t") 'ensime-inspect-type-at-point)
(define-key ensime-mode-map (kbd "M-r") 'ensime-refactor-rename)
(define-key ensime-mode-map (kbd "M-c") 'ensime-typecheck-current-buffer)
(define-key ensime-mode-map (kbd "M-e") 'ensime-print-errors-at-point)
(define-key ensime-mode-map (kbd "M-E") 'ensime-show-all-errors-and-warnings)
(define-key ensime-mode-map (kbd "M-d") 'ensime-edit-definition)
(define-key ensime-mode-map (kbd "TAB") 'ensime-company-complete-or-indent)
(define-key ensime-mode-map (kbd "M-i") 'ensime-import-type-at-point)

(evil-define-key 'insert ensime-mode-map (kbd "C-n") 'company-select-next)
(evil-define-key 'insert ensime-mode-map (kbd "C-p") 'company-select-previous)
(evil-define-key 'normal ensime-mode-map (kbd "C-]") 'ensime-edit-definition)
(evil-define-key 'normal ensime-mode-map (kbd "M-d") 'ensime-edit-definition)

(evil-define-key 'normal evil-jumper-mode-map (kbd "C-M-h") 'evil-jump-backward)
(evil-define-key 'normal evil-jumper-mode-map (kbd "C-M-l") 'evil-jump-forward)

(evil-define-key 'normal ensime-refactor-info-map (kbd "c") (lambda()(interactive)
                            (funcall continue-refactor)
                            (ensime-popup-buffer-quit-function)
                            ))
(evil-define-key 'normal ensime-refactor-info-map (kbd "q") (lambda()(interactive)
                            (funcall cancel-refactor)
                            (ensime-popup-buffer-quit-function)
                                                           ))




(setq ensime-completion-style 'company)

(provide 'init-ensime)
