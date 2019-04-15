(use-package scala-mode
  :ensure t
  :defer t
  :mode "\\.s\\(cala\\|bt\\)$")

(use-package sbt-mode
  :ensure t
  :defer t
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package lsp-mode
 :ensure t
 :defer t
 :init (setq lsp-prefer-flymake nil))

(use-package lsp-ui
  :ensure t
  :defer t
  :config
  (progn
    (setq lsp-ui-sideline-enable nil)
    (setq lsp-ui-doc-position 'at-point)
  )
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-scala
  :after scala-mode
  :demand t
  ;; Optional - enable lsp-scala automatically in scala files
  :hook (scala-mode . lsp))
(defvar lsp-scala--config-options `(:hover (:enabled t)))

(use-package company-lsp
  :after lsp-mode
  :ensure t
  :defer t
  :config
  (push 'company-lsp company-backends)
)


(provide 'init-metals)
