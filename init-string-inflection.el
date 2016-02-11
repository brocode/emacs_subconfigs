(require-package 'string-inflection)
(require 'string-inflection)

(define-key evil-normal-state-map (kbd "C-c c c") 'string-inflection-camelcase)
(define-key evil-normal-state-map (kbd "C-c c u") 'string-inflection-upcase)
(define-key evil-normal-state-map (kbd "C-c c s") 'string-inflection-underscore)

(provide 'init-string-inflection)
