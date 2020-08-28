;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (require 'tramp)
  (setq projectile-mode-line-function (lambda () (format " P[%s]" (projectile-project-name))))

  (projectile-mode)

  (setq projectile-require-project-root nil)

  ; without this projectile will try to run svn list to find project files
  (setq projectile-svn-command "find . -type f -print0")

  (add-to-list 'projectile-globally-ignored-directories "target")
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories ".ensime_cache")
  (add-to-list 'projectile-globally-ignored-directories "vendor"))


(use-package helm
  :ensure t
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ([remap execute-extended-command] . helm-M-x)
         ([remap yank-pop]        . helm-show-kill-ring)
         ([remap insert-register] . helm-register)
         ([remap apropos-command] . helm-apropos)
         ([remap occur] . helm-occur)
         :map helm-map
         ([esc] . helm-keyboard-quit)
         ("C-w" . backward-kill-word)
         ("C-r" . evil-paste-from-register)
         :map helm-grep-map
         ("C-w" . backward-kill-word))
  :config
  (require 'helm-grep)
  (setq helm-quick-update t)
  (setq helm-bookmark-show-location t)
  (setq helm-buffers-fuzzy-matching t)
  (setq projectile-completion-system 'helm)
  (setq helm-buffer-max-length 40)

  (helm-mode 1))

(use-package helm-projectile
  :ensure t
  :init
  (helm-projectile-on))

(use-package helm-unicode
  :ensure t
  :defer t
  :after helm
  :bind (("C-c i 8" . helm-unicode)))

(use-package helm-rage
  :ensure t
  ;:load-path "/data/home/phaun/development/projects/helm-rage"
  :defer t
  :init
  (define-key global-map (kbd "C-c r") 'helm-rage)
  :after helm)

(use-package helm-ag
  :ensure t
  :defer t
  :after helm
  :bind(
        :map helm-ag-map
        ("C-w" . backward-kill-word)))

(use-package helm-rg
  :ensure t
  :defer t
  :after helm
  :init
  (setq helm-rg-ripgrep-executable (expand-file-name "~/.cargo/bin/rg"))
  :bind(
        :map helm-rg-map
        ("C-w" . backward-kill-word)))

(use-package helm-swoop
  :ensure t
  :defer t
  :after helm)

(provide 'init-helm)
