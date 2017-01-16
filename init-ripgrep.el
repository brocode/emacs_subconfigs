(use-package ripgrep
  :ensure t
  :init
  (setq ripgrep-executable "~/.cargo/bin/rg"))

(use-package projectile-ripgrep
  :ensure t)


(provide 'init-ripgrep)
