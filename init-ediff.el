; don't create new window
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;split horizontal
(setq ediff-split-window-function 'split-window-horizontally)

;ignore whitespace
(setq ediff-diff-options "-w")

(defun ora-ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map "j" 'ediff-next-difference)
  (define-key ediff-mode-map "k" 'ediff-previous-difference))

(add-hook 'ediff-mode-hook 'ora-ediff-hook)


(provide 'init-ediff)
