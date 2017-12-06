
(use-package grep
  :init
  (progn
    (evil-define-key 'normal grep-mode-map (kbd "C-o") 'evil-jump-backward)
    (evil-define-key 'normal grep-mode-map (kbd "0") 'evil-beginning-of-line)
    (evil-define-key 'normal grep-mode-map (kbd "$") 'evil-end-of-line)))

(provide 'init-grep)
