(use-package string-inflection
  :ensure t
  :after evil
  :defer t
  :bind(
        :map evil-normal-state-map
             ("C-c c c" . string-inflection-camelcase)
             ("C-c c u" . string-inflection-upcase)
             ("C-c c s" . string-inflection-underscore)
             ("C-c c l" . string-inflection-lisp)))


(provide 'init-string-inflection)
