; trust marmalade certificate with TOFU (trust on first use). Not ideal and should be removed asap
(if (fboundp 'gnutls-available-p)
    (fmakunbound 'gnutls-available-p))
(setq tls-program '("gnutls-cli --tofu -p %p %h")
      imap-ssl-program '("gnutls-cli --tofu -p %p %s")
      smtpmail-stream-type 'starttls
      starttls-extra-arguments '("--tofu")
)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                        ("org" . "http://orgmode.org/elpa/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                        ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defun require-package (package)
    (setq-default highlight-tabs t)
    "Install given PACKAGE."
    (unless (package-installed-p package)
        (unless (assoc package package-archive-contents)
            (package-refresh-contents))
        (package-install package)))

(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(require 'use-package)

(provide 'init-packages)
