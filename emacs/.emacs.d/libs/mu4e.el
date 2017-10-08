; mu4e
; http://cachestocaches.com/2017/3/complete-guide-email-emacs-using-mu-and-/#an-introduction-to-mu
; https://gist.github.com/areina/3879626
;; offlineimap
; https://github.com/OfflineIMAP/offlineimap/blob/master/offlineimap.conf
; gmail oauth2
; https://hobo.house/2017/07/17/using-offlineimap-with-the-gmail-imap-api/
; https://github.com/google/gmail-oauth2-tools

(add-to-list 'load-path "/usr/local/opt/mu/share/emacs/site-lisp/mu/mu4e")
(setq mu4e-mu-binary (executable-find "/usr/local/opt/mu/bin/mu"))
(require 'mu4e)

;; default
(setq mu4e-maildir       "~/.mail")
(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")
(setq mu4e-refile-folder "/[Gmail].All Mail")

(use-package mu4e-alert
  :ensure t
  :after mu4e
  :init
  (defalias 'email 'mu4e)
  (defalias 'em 'mu4e)
  (setq mu4e-alert-interesting-mail-query
    (concat
     "flag:unread maildir:/Exchange/INBOX "
     "OR "
     "flag:unread maildir:/Gmail/INBOX"
     ))
  (mu4e-alert-enable-mode-line-display)
  (defun gjstein-refresh-mu4e-alert-mode-line ()
    (interactive)
    (mu4e~proc-kill)
    (mu4e-alert-enable-mode-line-display))
  (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line))

(provide 'mu4e)
