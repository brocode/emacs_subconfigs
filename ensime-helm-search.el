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
                  :action '(("open file" . (lambda (candidate) (message "selected: %s" (helm-marked-candidates))))
                            ("print info" . (lambda (candidate) (message "selected: %s" (helm-marked-candidates)))))
                  )
        :buffer "*ensime-helm-search*"))



(defun ensime-rpc-public-symbol-search
  (names max-results)
  (ensime-eval
   `(swank:public-symbol-search
     ,names
     ,max-results
     )))

