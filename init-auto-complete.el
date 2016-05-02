(use-package auto-complete
  :ensure t
  :diminish auto-complete-mode
  :init
  (ac-config-default)
  :bind (
         :map ac-completing-map
              ("\r" . nil)
              ("C-n" . ac-next)
              ("C-p" . ac-previous)
              )
  )

(provide 'init-auto-complete)
