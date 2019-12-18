(use-package lsp-java
  :ensure t
  :init
  (progn
    (evil-define-key 'insert java-mode-map (kbd "<tab>") 'company-indent-for-tab-command)
    (evil-define-key 'insert java-mode-map (kbd "TAB") 'company-indent-for-tab-command)
    (add-hook 'java-mode-hook #'lsp)))


(provide 'init-java)
