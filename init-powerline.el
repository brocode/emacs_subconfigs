(require-package 'spaceline)
(require 'spaceline-config)
(spaceline-spacemacs-theme)

(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

(custom-set-faces
 '(mode-line-inactive ((t (:background "brightwhite" :foreground "color-244" :box (:line-width 1 :color "gray40")))))
 '(powerline-active1 ((t (:inherit mode-line :background "black" :foreground "white"))))
 '(powerline-active2 ((t (:inherit mode-line :background "grey"))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "brightwhite" :foreground "color-243"))))
'(spaceline-evil-insert ((t (:background "tomato" :foreground "#3E3D31" :inherit (quote mode-line)))))
'(spaceline-evil-normal ((t (:background "green" :foreground "#3E3D31" :inherit (quote mode-line)))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "white")))))

(provide 'init-powerline)
