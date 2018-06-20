(use-package volatile-highlights
  :ensure t
  :diminish volatile-highlights-mode
  :init
    (volatile-highlights-mode t)
    (vhl/define-extension 'evil 'evil-paste-after 'evil-paste-before
                          'evil-paste-pop 'evil-move)
    (vhl/install-extension 'evil)
  (custom-set-faces
  '(secondary-selection ((t (:background "#ffffb3"))))))

(provide 'init-volatile-highlights)
