(use-package scala-mode
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
              (push '("::" . ?∷) prettify-symbols-alist)
              ))
  )

(provide 'init-scala)
