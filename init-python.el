(use-package python-mode
  :ensure t
  :init
  (add-hook 'python-mode-hook #'lsp))   ; pip install
                                        ; python-language-server[all]. Don't
                                        ; use all if you don't want
                                        ; all optional packages. Mak
                                        ; sure to start emacs with the
                                        ; venv already activated

(provide 'init-python)
