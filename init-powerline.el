(require-package 'spaceline)
(require 'spaceline-config)
(spaceline-spacemacs-theme)

(custom-set-faces
 '(ensime-implicit-highlight ((t (:foreground "color-177"))))
 '(mode-line-inactive ((t (:background "brightwhite" :foreground "color-244" :box (:line-width 1 :color "gray40")))))
 '(powerline-active1 ((t (:inherit mode-line :background "brightblack" :foreground "brightwhite"))))
 '(powerline-active2 ((t (:inherit mode-line :background "color-252"))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "brightwhite" :foreground "color-243"))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "white")))))

(provide 'init-powerline)
