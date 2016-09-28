(use-package evil
  :ensure t
  :init
  (setq evil-want-C-i-jump nil) ; org mode tab fix

  ; default is isearch. evil-seatch persists highlights on movements
  ;(setq evil-search-module 'evil-search)

  (setq evil-magic 'very-magic)

  (setq evil-want-C-w-in-emacs-state t)
  (setq evil-want-fine-undo 'no)
  (setq evil-shift-width 2)

  :config
  (evil-mode 1)

  (use-package evil-surround
    :ensure t
    :config
    (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
    (evil-define-key 'visual evil-surround-mode-map "S" 'evil-substitute)
    (global-evil-surround-mode 1))

  (use-package evil-quickscope
    :ensure t
    :config
    (require 'evil-quickscope)
    (global-evil-quickscope-mode 1))

  (use-package evil-numbers
    :ensure t
    :config
    (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
    (define-key evil-normal-state-map (kbd "C-s") 'evil-numbers/dec-at-pt))

  (use-package evil-numbers
    :ensure t)

  (use-package evil-matchit
    :ensure t
    :config
    (global-evil-matchit-mode 1))

  (use-package evil-visualstar
    :ensure t
    :config
    (global-evil-visualstar-mode t))

  (use-package evil-magit
    :ensure t
    :after magit)

  (use-package evil-multiedit
    :ensure t
    :after evil-visualstar
    :config
    ;; For moving between edit regions
    (define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
    (define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
    (define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
    (define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)
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

    ;; Allows you to invoke evil-multiedit with a regular expression
    (evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match))

  (use-package move-text
    :ensure t
    :config
    (define-key evil-normal-state-map (kbd "[ e") 'move-text-up)
    (define-key evil-normal-state-map (kbd "] e") 'move-text-down))

  (defun evil-unimpaired//find-relative-filename (offset)
    (when buffer-file-name
      (let* ((directory (f-dirname buffer-file-name))
             (files (f--files directory (not (s-matches? "^\\.?#" it))))
             (index (+ (-elem-index buffer-file-name files) offset))
             (file (and (>= index 0) (nth index files))))
        (when file
          (f-expand file directory)))))

  (defun evil-unimpaired/previous-file ()
    (interactive)
    (-if-let (filename (evil-unimpaired//find-relative-filename -1))
        (find-file filename)
      (user-error "No previous file")))

  (defun evil-unimpaired/next-file ()
    (interactive)
    (-if-let (filename (evil-unimpaired//find-relative-filename 1))
        (find-file filename)
      (user-error "No next file")))

  (defun evil-unimpaired/paste-above ()
    (interactive)
    (evil-insert-newline-above)
    (evil-paste-after 1))

  (defun evil-unimpaired/paste-below ()
    (interactive)
    (evil-insert-newline-below)
    (evil-paste-after 1))

  (defun evil-unimpaired/insert-space-above ()
    (interactive)
    (save-excursion
      (evil-insert-newline-above)))

  (defun evil-unimpaired/insert-space-below ()
    (interactive)
    (save-excursion
      (evil-insert-newline-below)))

  (defun evil-unimpaired/next-frame ()
    (interactive)
    (raise-frame (next-frame)))

  (defun evil-unimpaired/previous-frame ()
    (interactive)
    (raise-frame (previous-frame)))

  ;; from tpope's unimpaired
  (define-key evil-normal-state-map (kbd "[ SPC")
    'evil-unimpaired/insert-space-above)
  (define-key evil-normal-state-map (kbd "] SPC")
    'evil-unimpaired/insert-space-below)
  (define-key evil-visual-state-map (kbd "[ e") ":move'<--1")
  (define-key evil-visual-state-map (kbd "] e") ":move'>+1")
  (define-key evil-normal-state-map (kbd "[ f") 'evil-unimpaired/previous-file)
  (define-key evil-normal-state-map (kbd "] f") 'evil-unimpaired/next-file)
  (define-key evil-normal-state-map (kbd "[ h") 'diff-hl-previous-hunk)
  (define-key evil-normal-state-map (kbd "] h") 'diff-hl-next-hunk)
  (define-key evil-normal-state-map (kbd "[ t") 'evil-unimpaired/previous-frame)
  (define-key evil-normal-state-map (kbd "] t") 'evil-unimpaired/next-frame)
  (define-key evil-normal-state-map (kbd "[ w") 'previous-multiframe-window)
  (define-key evil-normal-state-map (kbd "] w") 'next-multiframe-window)
  ;; select pasted text
  (define-key evil-normal-state-map (kbd "g p") (kbd "` [ v ` ]"))
  ;; paste above or below with newline
  (define-key evil-normal-state-map (kbd "[ p") 'evil-unimpaired/paste-above)
  (define-key evil-normal-state-map (kbd "] p") 'evil-unimpaired/paste-below)

                                        ;move between buffers
  (define-key evil-normal-state-map (kbd "] b") 'next-buffer)
  (define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)

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

  (define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)
  (define-key minibuffer-local-map (kbd "C-r") 'evil-paste-from-register)


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

  (define-key evil-motion-state-map "\C-]" nil)
  )

(provide 'init-evil)

