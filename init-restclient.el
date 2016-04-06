(require-package 'restclient)
(require 'restclient)

(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

(provide 'init-restclient)
