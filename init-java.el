(use-package lsp-java
  :ensure t
  :init
  (progn
    (evil-define-key 'insert java-mode-map (kbd "<tab>") 'company-indent-for-tab-command)
    (evil-define-key 'insert java-mode-map (kbd "TAB") 'company-indent-for-tab-command)
    (setq lsp-java-vmargs
            `("-noverify"
              "-Xmx1G"
              "-XX:+UseG1GC"
              "-XX:+UseStringDeduplication"
              ,(concat "-javaagent:" "/opt/lombok/lombok.jar")
              ,(concat "-Xbootclasspath/a:" "/opt/lombok/lombok.jar")))
    (add-hook 'java-mode-hook #'lsp)))


(provide 'init-java)
