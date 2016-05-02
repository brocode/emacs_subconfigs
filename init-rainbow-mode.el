(require-package 'rainbow-mode)
(require 'rainbow-mode)

(add-hook 'css-mode-hook #'rainbow-mode)
(add-hook 'less-mode-hook #'rainbow-mode)

(diminish 'rainbow-mode)

(provide 'init-rainbow-mode)
