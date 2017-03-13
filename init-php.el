(use-package php-mode
  :ensure t)

;; (use-package company-php
;;   :ensure t)

;; (use-package ac-php
;;   :ensure t
;;   :after php-mode company company-php
;;   :init
;;   (add-hook 'php-mode-hook
;;           '(lambda ()
;;              (company-mode t)
;;              (add-to-list 'company-backends 'company-ac-php-backend ))))

(provide 'init-php)
