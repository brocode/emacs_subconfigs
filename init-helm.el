;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)
(require-package 'helm)
(require-package 'projectile)
(require-package 'helm-projectile)

(setq helm-buffer-max-length 40)

(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)
(setq projectile-completion-system 'helm)
(setq projectile-require-project-root nil)

(add-to-list 'projectile-globally-ignored-directories "target")
(add-to-list 'projectile-globally-ignored-directories ".ensime_cache")

; without this projectile will try to run svn list to find project files
(setq projectile-svn-command "find . -type f -print0")

(global-set-key (kbd "M-x") 'helm-M-x)
(define-key helm-map [esc] 'helm-keyboard-quit)
(define-key helm-grep-map (kbd "C-w") 'backward-kill-word)

(helm-mode 1)

(projectile-global-mode)
(helm-projectile-on)

(provide 'init-helm)
