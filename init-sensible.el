
(menu-bar-mode -1)

;; backup files are evil
(setq make-backup-files nil)

;; lockfiles are evil.
(setq create-lockfiles nil)

;; autosave is evil
(setq auto-save-default nil)

(set 'ad-redefinition-action 'accept)

;; Show me the new saved file if the contents change on disk when editing.
(global-auto-revert-mode 1)

;; save history
(setq savehist-additional-variables    ;; also save...
  '(search-ring regexp-search-ring)    ;; ... my search entries
  savehist-file "~/.emacs.d/savehist") ;; keep my home clean
(savehist-mode t)                      ;; do customization before activate

;smooth scrolling
(setq scroll-margin 7
      scroll-conservatively 9999
      scroll-step 1)

;whitespace style
(setq whitespace-display-mappings
  '(
    (space-mark 32 [183] [46]) ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
    (newline-mark 10 [182 10]) ; 10 LINE FEED
    (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
    ))

; remember file position
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;show mathing parens
(show-paren-mode t)

;tab settings
(setq-default tab-width 2 indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;; require a trailing newline
(setq require-final-newline t)

;; don't put intitial text in scratch buffer
(setq initial-scratch-message nil)


;; Disable toolbars and splash screens.
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Hide startup messages
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; UTF-8 everything!
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; Flash the frame to represent a bell.
(setq visible-bell t)
;; nevermind that's annoying
(setq ring-bell-function 'ignore)

;disable scrollbar
(scroll-bar-mode -1)

;always follow symlinks
(setq vc-follow-symlinks t)

;replace "yes or no" prompts with "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

; 2 line indent
(setq-default tab-width 2 indent-tabs-mode nil)
(setq js-indent-level 2)
(setq c-basic-offset 2)

(setq x-select-enable-clipboard nil)

; save all file buffers on focus loss
(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

; increase performance for large files
(defun check-large-file-hook ()
  "If a file is over a given size, turn off minor modes"
  (if (> (buffer-size) (* 1024 1024)) ;; 1 MB
      (progn
       (fundamental-mode)
       (font-lock-mode -1)
       (linum-mode -1)
       ;(setq buffer-read-only t)
       ;(buffer-disable-undo)
    )
    (when (> (count-lines (point-min) (point-max)) 1500) (linum-mode -1))
  ))
(add-hook 'find-file-hook 'check-large-file-hook)

; show trailing whitespace
(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace t)))
(add-hook 'conf-mode-hook (lambda () (setq show-trailing-whitespace t)))

(provide 'init-sensible)
