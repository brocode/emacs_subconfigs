(require-package 'auto-complete)
(require 'auto-complete)

(ac-config-default)
(define-key ac-completing-map "\r" nil)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

(provide 'init-auto-complete)
