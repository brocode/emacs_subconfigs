(defun ensime-helm-public-symbol-search ()
  "searches for symbols with the given query"
  (if (>= (length helm-pattern) ensime-search-min-length)
      (mapcar (lambda (elem) (cons (ensime-search-sym-name elem) elem)) (ensime-rpc-public-symbol-search (split-string helm-pattern " ") ensime-search-max-results))
    '(("query to short" . "moep"))
    ))

(defun ensime-helm-search ()
  "searches ensime with helm"
  (interactive)
  (helm :sources (helm-build-sync-source "ensime-search"
                  :candidates 'ensime-helm-public-symbol-search
                  :volatile t
                  :requires-pattern ensime-search-min-length
                  :action '(("open" . ensime-helm-open-candidate)
                            ("print info" . (lambda (candidate) (message "selected: %s" candidate))))
                  )
        :buffer "*ensime-helm-search*"))



(defun ensime-rpc-public-symbol-search
  (names max-results)
  (ensime-eval
   `(swank:public-symbol-search
     ,names
     ,max-results
     )))

(defun ensime-helm-open-candidate (candidate)
  "Opens the candidate"
  (let ((pos (ensime-search-sym-pos candidate)))
      (let* ((file-name (ensime-pos-file pos))
                  (line (ensime-pos-line pos))
      (offset (ensime-pos-offset pos)))
        (if (and file-name
          (integerp (string-match
          "\\.scala$\\|\\.java$"
          file-name)))
      (progn
        (find-file file-name)
                    (cond
                    (offset (goto-char (ensime-internalize-offset offset)))
                    (line (ensime-goto-line line))))

          ;; Otherwise, open the inspector
          (let ((decl-as (ensime-search-sym-decl-as item)))
      (cond
      ((or (equal decl-as 'method)
            (equal decl-as 'field))
        (ensime-inspect-by-path
        (ensime-search-sym-owner-name item)
        (ensime-search-sym-local-name item)
        ))

      (t (ensime-inspect-by-path
          (ensime-search-sym-name item)))))))))
