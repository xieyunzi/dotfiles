(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-enable-at-startup nil)

(add-to-list 'load-path (expand-file-name "libs" user-emacs-directory))
(package-initialize) ;; You might already have this line

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (diff-hl
     evil-mc
     rainbow-delimiters
     es-mode
     python-mode
     rc-mode
     markdown-mode
     evil-mu4e
     mu4e-alert
     graphql-mode
     magit
     evil-cleverparens
     which-key
     async
     inf-ruby
     clojure-mode
     multiple-cursors
     go-mode
     smex
     web-mode
     expand-region
     clj-refactor
     robe
     yaml-mode
     company
     find-file-in-project
     ag
     helm-projectile
     projectile
     helm-ag
     evil-leader
     helm
     neotree
     evil
     evil-tutor
     cider
     slime
     ))))
;; smartparens
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; by xz

;; Essential settings. {{{
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

; enable line mode
(global-linum-mode t)
(setq linum-format "%d ")

(menu-bar-mode -1)
(tool-bar-mode -1)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode 1)

(setq split-height-threshold nil)
(setq split-width-threshold 0)

(setq whitespace-style '(tabs tab-mark))
(global-whitespace-mode)

(setq make-backup-files nil)
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/.saves")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/.saves" t)))
(setq create-lockfiles nil)

(winner-mode 1)

; http://andrewjamesjohnson.com/suppressing-ad-handle-definition-warnings-in-emacs/
(setq ad-redefinition-action 'accept)
;; }}}

(require 'init-entire)
(require 'navigate)
(require 'pbcopy)
(require 'mu4e)

(provide 'init)
