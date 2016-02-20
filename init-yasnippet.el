(require-package 'yasnippet)
(require 'yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/subconfigs/snippets" yas-installed-snippets-dir))

(yas-global-mode 1)

(provide 'init-yasnippet)
