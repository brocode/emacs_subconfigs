(use-package go-mode
  :ensure t
  :defer t
  :init
  (progn
    (evil-set-command-property 'godef-jump :jump t)
    (evil-define-key 'normal go-mode-map (kbd "C-]") 'evil-goto-definition)
    (when (not (getenv "GOPATH")) (setenv "GOPATH" (expand-file-name "~/go/")))
    (add-hook 'go-mode-hook #'lsp))) ; 'go get -u golang.org/x/tools/cmd/gopls' and add to path


(provide 'init-go)
