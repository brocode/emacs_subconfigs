(use-package elm-mode
  :ensure t
  :defer t
  :init
  (setq elm-format-on-save t)
  (add-hook 'elm-mode-hook #'elm-oracle-setup-completion)
  (add-to-list 'company-backends 'company-elm)
)

(provide 'init-elm)
