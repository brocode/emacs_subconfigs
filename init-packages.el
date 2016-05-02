(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                        ("org" . "http://orgmode.org/elpa/")
                        ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defun require-package (package)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))


(require-package 'use-package)
(require 'use-package)

(provide 'init-packages)
