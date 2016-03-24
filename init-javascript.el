(require-package 'js2-mode)

(setq js2-basic-offset 2)

(require 'js2-mode)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(provide 'init-javascript)
