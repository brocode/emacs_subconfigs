(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init
  (require 'smartparens-config)
  (setq sp-highlight-pair-overlay nil)
  (setq sp-highlight-wrap-overlay nil)
  (setq sp-highlight-wrap-tag-overlay nil)
  (evil-define-key 'normal smartparens-mode-map (kbd "C-c <") 'sp-forward-barf-sexp)
  (evil-define-key 'normal smartparens-mode-map (kbd "C-c >") 'sp-forward-slurp-sexp)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-mode))

(provide 'init-smartparens)
