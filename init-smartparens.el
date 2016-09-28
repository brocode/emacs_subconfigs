(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init
  (require 'smartparens-config)
  (setq sp-highlight-pair-overlay nil)
  (setq sp-highlight-wrap-overlay nil)
  (setq sp-highlight-wrap-tag-overlay nil)
  ; in case global mode turns out to be annoying as hell use this instead
  ;(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
  (smartparens-global-mode t))

(use-package evil-cleverparens
  :after smartparens
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode))

(provide 'init-smartparens)
