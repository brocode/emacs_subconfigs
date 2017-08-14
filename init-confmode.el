(use-package conf-mode
  :init
  (add-to-list 'auto-mode-alist '("\\/.npmrc\\'" . conf-mode)))

(provide 'init-confmode)
