(use-package markdown-mode
  :ensure t
  :defer t
  :mode
  ("\\.text\\'" . gfm-mode)
  ("\\.markdown\\'" . gfm-mode)
  ("\\.md\\'" . gfm-mode))


(provide 'init-markdown)
