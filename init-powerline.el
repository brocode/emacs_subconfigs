(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)

  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

  (custom-set-faces
   '(mode-line-inactive ((t (:background "#EEEEEE" :foreground "#AAAAAA" :box (:line-width 1 :color "#666666")))))
   '(powerline-active1 ((t (:inherit mode-line :background "#444444" :foreground "#FFFFFF"))))
   '(powerline-active2 ((t (:inherit mode-line :background "#BBBBBB"))))
   '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "#FFFFFF" :foreground "#AAAAAA"))))
   '(spaceline-evil-insert ((t (:background "#FF6347" :foreground "#FFFFFF" :inherit (quote mode-line)))))
   '(spaceline-evil-normal ((t (:background "#00cd00" :foreground "#FFFFFF" :inherit (quote mode-line)))))
   '(spaceline-evil-visual ((t (:background "#ffaf00" :foreground "#FFFFFF" :inherit (quote mode-line)))))
   '(spaceline-evil-emacs ((t (:background "#af00d7" :foreground "#FFFFFF" :inherit (quote mode-line)))))
   '(spaceline-evil-motion ((t (:background "#9400D3" :foreground "#FFFFFF" :inherit (quote mode-line)))))
   '(spaceline-evil-replace ((t (:background "#5f97ff" :foreground "#FFFFFF" :inherit (quote mode-line)))))
   '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "#e5e5e5")))))
  )


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
