(use-package es-mode
  :ensure t
  :after company
  :init
  (evil-define-key 'insert es-mode-map (kbd "TAB") #'company-complete-common-or-cycle)
  (setq es-always-pretty-print t))

(provide 'init-elastic)
