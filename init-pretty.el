(setq prettify-symbols-unprettify-at-point 'right-edge)

(global-prettify-symbols-mode +1)

(global-set-key (kbd "<f6>") 'prettify-symbols-mode)

(add-hook 'prog-mode-hook
          (lambda ()
            (dolist  (elem
                      '(
                        ("<=" . ?≤)
                        (">=" . ?≥)
                        ("<-" . ?←)
                        ("=>" . ?⇒)
                        ("->" . ?→)
                        ("!=" . ?≠)
                        ("->" . ?→)
                        ("<=>" . ?⇔)
                        ("<->" . ?↔)
                        (">>" . ?»)
                        ("<<" . ?«)))
              (push elem prettify-symbols-alist))))


(provide 'init-pretty)
