(use-package racer
  :defer t
  :ensure t
  :after company rust
  :init
  (setq racer-cmd "~/.cargo/bin/racer")
  (setq racer-rust-src-path "~/workspace/rust/src")
  (setq rust-rustfmt-bin "~/.cargo/bin/rustfmt")
  ; to use with rust format set tab_spaces = 2 in rustfmt.toml
  (setq rust-indent-offset 2)
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  :config
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (define-key rust-mode-map (kbd "M-d") 'racer-find-definition)
  (evil-define-key 'insert rust-mode-map (kbd "C-n") 'company-select-next)
  (evil-define-key 'insert rust-mode-map (kbd "C-p") 'company-select-previous)
)

(use-package rust-mode
  :defer t
  :ensure t
)

(use-package flycheck-rust
  :after flycheck
  :ensure t
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(provide 'init-rust)
