(use-package dired
  ;:after evil
  :config
  (evil-define-key 'normal dired-mode-map "k" 'dired-previous-line)
  (evil-define-key 'normal dired-mode-map "j" 'dired-next-line)
  (evil-define-key 'normal dired-mode-map "l" 'dired-find-file)
  (evil-define-key 'normal dired-mode-map "h" 'dired-up-directory)

  (evil-define-key 'normal dired-mode-map (kbd "C-j") 'dired-next-subdir)
  (evil-define-key 'normal dired-mode-map (kbd "C-k") 'dired-prev-subdir)
  (evil-define-key 'normal dired-mode-map "o" 'dired-sort-toggle-or-edit)
  (evil-define-key 'normal dired-mode-map "v" 'dired-toggle-marks)
  (evil-define-key 'normal dired-mode-map "m" 'dired-mark)
  (evil-define-key 'normal dired-mode-map "u" 'dired-unmark)
  (evil-define-key 'normal dired-mode-map "U" 'dired-unmark-all-marks)
  (evil-define-key 'normal dired-mode-map "c" 'dired-create-directory)

  (evil-define-key 'normal dired-mode-map (kbd "SPC SPC") 'helm-M-x)

)

(provide 'init-dired)
