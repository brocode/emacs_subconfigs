(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  :config
  (custom-set-faces
  '(rainbow-delimiters-depth-1-face ((t (:foreground "#cd00cd"))))
  '(rainbow-delimiters-depth-2-face ((t (:foreground "#00af00"))))
  '(rainbow-delimiters-depth-3-face ((t (:foreground "#0000ee"))))
  '(rainbow-delimiters-depth-4-face ((t (:foreground "#00875f"))))
  '(rainbow-delimiters-depth-5-face ((t (:foreground "#875f00"))))
  '(rainbow-delimiters-depth-6-face ((t (:foreground "#d7005f"))))
  '(rainbow-delimiters-depth-7-face ((t (:foreground "#5f5fff"))))
  '(rainbow-delimiters-depth-8-face ((t (:foreground "#00cd00"))))
  '(rainbow-delimiters-depth-9-face ((t (:foreground "#00005f"))))))

(provide 'init-rainbow-delimiters)
