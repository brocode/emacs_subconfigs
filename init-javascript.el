(use-package js2-mode
  :ensure t
  :defer t
  :mode ("\\.js$" . js2-mode))
  :init
  (setq js2-basic-offset 2)
  (autoload 'js2-mode "js2-mode" nil t)

(provide 'init-javascript)
