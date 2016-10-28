(use-package flycheck
  :ensure t
  :defer t
  :diminish (flycheck-mode . "✔")
  :config
  (evil-define-key 'normal flycheck-error-list-mode-map
      "q" 'quit-window
      "j" #'flycheck-error-list-next-error
      "k" #'flycheck-error-list-previous-error
      "K" #'evil-previous-line
      "J" #'evil-next-line
      (kbd "RET") #'flycheck-error-list-goto-error)
)

(provide 'init-flycheck)
