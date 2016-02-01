(require-package 'auto-complete)
(require 'auto-complete)

(ac-config-default)
(define-key ac-completing-map "\r" nil)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

(defadvice auto-complete-mode (around disable-auto-complete-for-scala)
  (unless (eq major-mode 'scala-mode) ad-do-it))

(ad-activate 'auto-complete-mode)

(provide 'init-auto-complete)
