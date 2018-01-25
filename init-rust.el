
(use-package rust-mode
  :defer t
  :ensure t
  :after flycheck
  :init
  (add-hook 'rust-mode-hook #'flycheck-mode)
  (add-to-list 'auto-mode-alist '("\\.toml\\'" . conf-mode))
)

(use-package racer
  :defer t
  :ensure t
  :init
  (setq racer-cmd (expand-file-name "~/.cargo/bin/racer"))
  (setq rust-rustfmt-bin (expand-file-name "~/.cargo/bin/rustfmt"))
  ; to use with rust format set tab_spaces = 2 in rustfmt.toml
  (setq rust-indent-offset 2)
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  :config
  (modify-syntax-entry ?_ "w" rust-mode-syntax-table)
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (define-key rust-mode-map (kbd "M-d") 'racer-find-definition)
  (define-key rust-mode-map (kbd "C-]") 'racer-find-definition)
  (evil-define-key 'insert rust-mode-map (kbd "C-n") 'company-select-next)
  (evil-define-key 'insert rust-mode-map (kbd "C-p") 'company-select-previous)
)

(use-package flycheck-rust
  :after flycheck
  :ensure t
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(provide 'init-rust)
