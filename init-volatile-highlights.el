(use-package volatile-highlights
  :ensure t
  :init
    (volatile-highlights-mode t)
    (vhl/define-extension 'evil 'evil-paste-after 'evil-paste-before
                          'evil-paste-pop 'evil-move)
    (vhl/install-extension 'evil)
)

(provide 'init-volatile-highlights)
