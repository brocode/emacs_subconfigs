; syntax highlightning in org mode snippets
(setq org-src-fontify-natively t)


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

(provide 'init-org-mode)
