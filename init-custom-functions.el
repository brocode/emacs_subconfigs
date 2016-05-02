(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
        (if face (message "Face: %s" face) (message "No face at %d" pos))))

(provide 'init-custom-functions)
