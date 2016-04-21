(require 'evil)
(require-package 'move-text)
(require 'move-text)

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
(define-key evil-normal-state-map (kbd "[ e") 'move-text-up)
(define-key evil-normal-state-map (kbd "] e") 'move-text-down)
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

(provide 'init-evil-unimpaired)
