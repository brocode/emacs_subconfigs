(use-package auto-complete
  :ensure t
  :diminish auto-complete-mode
  :config
  (define-key ac-completing-map "\r" nil)
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)
  (ac-config-default)
)

(provide 'init-auto-complete)
