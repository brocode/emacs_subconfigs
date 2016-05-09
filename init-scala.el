(use-package scala-mode2
  :ensure t
  :defer t
  :config
  (add-hook 'scala-mode-hook
            (lambda ()
              (push '("<=" . ?≤) prettify-symbols-alist)
              (push '(">=" . ?≥) prettify-symbols-alist)
              (push '("<-" . ?←) prettify-symbols-alist)
              (push '("=>" . ?⇒) prettify-symbols-alist)
              (push '("->" . ?→) prettify-symbols-alist)
              ))
  )

(provide 'init-scala)
