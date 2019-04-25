(use-package python-mode
  :ensure t
  :init
  (add-hook 'python-mode-hook #'lsp))
      ;; Make sure to start emacs with the venv already activated
      ;; The base language server requires Jedi to provide Completions, Definitions, Hover, References, Signature Help, and Symbols:

      ;; pip install python-language-server

      ;; If the respective dependencies are found, the following optional providers will be enabled:

      ;;     Rope for Completions and renaming
      ;;     Pyflakes linter to detect various errors
      ;;     McCabe linter for complexity checking
      ;;     pycodestyle linter for style checking
      ;;     pydocstyle linter for docstring style checking (disabled by default)
      ;;     autopep8 for code formatting
      ;;     YAPF for code formatting (preferred over autopep8)

      ;; install all with: pip install python-language-server[all]


(provide 'init-python)
