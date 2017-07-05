(defun bro-what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(require 'ansi-color)

(defun bro-display-ansi-colors ()
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max)))


(defun bro-kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (message "Killed %s buffers." (length(mapcar 'kill-buffer
                                                 (delq (current-buffer)
                                                       (remove-if-not 'buffer-file-name (buffer-list)))))))


(provide 'init-custom-functions)
