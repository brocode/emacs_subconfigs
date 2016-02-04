(defun syntax-color-hex ()
    "Syntax color text of the form 「#ff1100」 in current buffer.
URL `http://ergoemacs.org/emacs/emacs_CSS_colors.html'
Version 2015-06-11"
    (interactive)
    (font-lock-add-keywords
     nil
     '(("#[abcdefABCDEF[:digit:]]\\{6\\}"
        (0 (put-text-property
            (match-beginning 0)
            (match-end 0)
            'face (list :background (match-string-no-properties 0)))))))
      (font-lock-fontify-buffer))

(provide 'init-custom-functions)
