(use-package smartparens
  :ensure t
  :init
  (require 'smartparens-config)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-mode))

(use-package evil-cleverparens
  :after smartparens
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode))

(provide 'init-smartparens)
