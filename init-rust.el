(use-package racer
  :defer t
  :ensure t
  :after company rust
  :init
  (setq racer-cmd "~/workspace/racer/target/release/racer")
  (setq racer-rust-src-path "~/workspace/rust/src")
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  :config
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (define-key rust-mode-map (kbd "M-d") 'racer-find-definition)
)

(use-package rust-mode
  :defer t
  :ensure t
)

(provide 'init-rust)
