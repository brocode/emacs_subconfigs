(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)

  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state))


(use-package diminish
  :ensure t
  :config
  (diminish 'visual-line-mode)
  (diminish 'autopair-mode)
  (diminish 'guide-key-mode)
  (diminish 'eldoc-mode)
  (diminish 'smartparens-mode)
  (diminish 'company-mode)
  (diminish 'elisp-slime-nav-mode)
  (diminish 'git-gutter+-mode)
  (diminish 'magit-auto-revert-mode)
  (diminish 'auto-revert-mode)
  (diminish 'hs-minor-mode)
  (diminish 'color-identifiers-mode)
  )

(provide 'init-powerline)
