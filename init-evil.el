(require-package 'evil)

(setq evil-want-C-i-jump nil) ; org mode tab fix
(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)

(setq evil-want-C-w-in-emacs-state t)
(setq evil-want-fine-undo 'no)
(setq evil-shift-width 2)

(require 'evil)
(evil-mode 1)

(require-package 'evil-surround)
(require 'evil-surround)
(global-evil-surround-mode 1)

(require-package 'evil-numbers)
(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-s") 'evil-numbers/dec-at-pt)

(require-package 'evil-matchit)
(require 'evil-matchit)
(global-evil-matchit-mode 1)

(require-package 'evil-visualstar)
(require 'evil-visualstar)
(global-evil-visualstar-mode t)

(require-package 'evil-magit)
(require 'evil-magit)

(require-package 'evil-jumper)
(require 'evil-jumper)

(require-package 'evil-multiedit)
(require 'evil-multiedit)

(global-evil-jumper-mode 1)


;; indent on ret
(define-key evil-insert-state-map (kbd "RET") 'newline-and-indent)
(define-key evil-normal-state-map (kbd "SPC SPC") 'helm-M-x)
(define-key evil-visual-state-map (kbd "SPC SPC") 'helm-M-x)

;move between buffers
(define-key evil-normal-state-map (kbd "] b") 'next-buffer)
(define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)

;move in wraps
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)


;; evil mappings in package list
(defun my-package-list-get-q-key ()
  "Lookup the current meaning of `q` key in the active package-menu-mode"
  (interactive)
  (call-interactively (lookup-key package-menu-mode-map "q"))
)
(evil-set-initial-state 'package-menu-mode 'normal)
(evil-define-key 'normal package-menu-mode-map
  ;; bound when package-menu is initialized
  ;; for clearing filters.
  "q" 'my-package-list-get-q-key
  "d" 'package-menu-mark-delete
  "i" 'package-menu-mark-install
  "U" 'package-menu-mark-upgrades
  "r" 'package-menu-refresh
  "K" 'package-menu-describe-package
  "u" 'package-menu-mark-unmark
  "\177" 'package-menu-backup-unmark
  "d" 'package-menu-mark-delete
  "i" 'package-menu-mark-install
  "U" 'package-menu-mark-upgrades
  "r" 'package-menu-refresh
  "/" 'package-menu-filter
  "~" 'package-menu-mark-obsolete-for-deletion
  "x" 'package-menu-execute
  "?" 'package-menu-quick-help
)
(evil-define-key 'motion package-menu-mode-map
  "q" 'my-package-list-get-q-key
  "h" 'evil-backward-char
  "j" 'evil-next-visual-line
  "k" 'evil-previous-visual-line
  "l" 'evil-forward-char
)

; shells
(evil-define-key 'insert comint-mode-map (kbd "C-p") 'comint-previous-input)
(evil-define-key 'insert comint-mode-map (kbd "C-n") 'comint-next-input)
(evil-define-key 'insert inferior-emacs-lisp-mode-map (kbd "C-p") 'comint-previous-input)
(evil-define-key 'insert inferior-emacs-lisp-mode-map (kbd "C-n") 'comint-next-input)


; multiedit

;; Highlights all matches of the selection in the buffer.
(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

;; Match the word under cursor (i.e. make it an edit region). Consecutive
;; presses will incrementally add the next unmatched match.
(define-key evil-normal-state-map (kbd "M-J") 'evil-multiedit-match-and-next)
;; Match selected region.
(define-key evil-visual-state-map (kbd "M-J") 'evil-multiedit-match-and-next)


;; Restore the last group of multiedit regions.
(define-key evil-visual-state-map (kbd "C-M-j") 'evil-multiedit-restore)

;; RET will toggle the region under the cursor
(define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ...and in visual mode, RET will disable all fields outside the selected
;; region
(define-key evil-visual-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; For moving between edit regions
(define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
(define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

;; Allows you to invoke evil-multiedit with a regular expression
(evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)

(provide 'init-evil)

