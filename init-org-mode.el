
(use-package org
  :ensure t
  :defer t
  :config
                                        ; syntax highlightning in org mode snippets
  (setq org-src-fontify-natively t)

                                        ; hide *emphasis* /markers/
  (setq org-hide-emphasis-markers t)


  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.25))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.1)))))


                                        ; org-latex-listings: nil means the default verbatim block export,
                                        ; 'minted means the minted package and any non-nil value other
                                        ; than 'minted means the listings package.
  (setq org-latex-listings t)
  (setq org-export-latex-listings t)

  (require 'ox-latex)
  (add-to-list 'org-latex-packages-alist '("" "listings"))

  (evil-define-key 'normal org-mode-map (kbd "M-k") 'org-metaup)
  (evil-define-key 'normal org-mode-map (kbd "M-j") 'org-metadown)
  (evil-define-key 'normal org-mode-map (kbd "M-h") 'org-metaleft)
  (evil-define-key 'normal org-mode-map (kbd "M-l") 'org-metaright)

  (evil-define-key 'normal org-mode-map (kbd "M-K") 'org-shiftmetaup)
  (evil-define-key 'normal org-mode-map (kbd "M-J") 'org-shiftmetadown)
  (evil-define-key 'normal org-mode-map (kbd "M-H") 'org-shiftmetaleft)
  (evil-define-key 'normal org-mode-map (kbd "M-L") 'org-shiftmetaright)

  (evil-define-key 'normal org-mode-map (kbd "$") 'org-end-of-line)
  (evil-define-key 'normal org-mode-map (kbd "^") 'org-beginning-of-line)
  (evil-define-key 'normal org-mode-map (kbd "0") 'org-beginning-of-line)

  (evil-define-key 'normal org-mode-map (kbd "-") 'org-cycle-list-bullet)
  )

(use-package org-bullets
  :ensure t
  :config
                                        ; better bullets
  (font-lock-add-keywords 'org-mode '(("^ +\\([-*]\\) " (0 (prog1 ()
                                                             (compose-region (match-beginning 1) (match-end
                                                                                                  1) "•"))))))

                                        ; better header bullets
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

(provide 'init-org-mode)
