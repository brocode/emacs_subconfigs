;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)

  (setq projectile-require-project-root nil)

  ; without this projectile will try to run svn list to find project files
  (setq projectile-svn-command "find . -type f -print0")

  (add-to-list 'projectile-globally-ignored-directories "target")
  (add-to-list 'projectile-globally-ignored-directories ".ensime_cache"))


(use-package helm
  :ensure t
  :diminish helm-mode
  :config
  (require 'helm-grep)
  (define-key helm-grep-map (kbd "C-w") 'backward-kill-word)
  (setq helm-quick-update t)
  (setq helm-bookmark-show-location t)
  (setq helm-buffers-fuzzy-matching t)
  (setq projectile-completion-system 'helm)
  (setq helm-buffer-max-length 40)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (define-key helm-map [esc] 'helm-keyboard-quit)

  (helm-mode 1)

  (helm-projectile-on))

(use-package helm-projectile
  :ensure t
  :after helm projectile)
(use-package helm-unicode
  :ensure t
  :defer t
  :after helm
  :config
  (global-set-key (kbd "C-c i 8") 'helm-unicode))


(provide 'init-helm)
