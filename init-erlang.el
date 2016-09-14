(use-package erlang
  :ensure t
  :defer t
  :after company  flycheck
  :init
  (require 'flycheck)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; (flycheck-define-checker erlang-otp                                          ;;
  ;;   "An Erlang syntax checker using the Erlang interpreter."                   ;;
  ;;   :command ("erlc" "-o" temporary-directory "-Wall"                          ;;
  ;;             "-I" "../include" "-I" "../../include"                           ;;
  ;;             "-I" "../../../include" source)                                  ;;
  ;;   :error-patterns                                                            ;;
  ;;   ((warning line-start (file-name) ":" line ": Warning:" (message) line-end) ;;
  ;;   (error line-start (file-name) ":" line ": " (message) line-end)))          ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (add-hook 'erlang-mode-hook
    (lambda ()
      (flycheck-select-checker 'erlang-otp)
      (flycheck-mode)))
)

(provide 'init-erlang)
