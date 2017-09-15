(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol))
  )

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (setq evil-leader/in-all-states 1)
  (evil-leader/set-key
    "m"  'neotree-toggle
    "n"  'neotree-project-dir
    "."  'switch-to-previous-buffer
    "/"  'evil-search-highlight-persist-remove-all
    "h"  'help-map
    "ag" 'helm-projectile-ag
    "fd" 'helm-projectile-find-dir
    "ff" 'helm-find-files
    "pa" 'helm-projectile-find-file-in-known-projects
    "z" 'zoom-window-zoom
    "be" (lambda () (interactive) (bookmark-jump "emacs"))
    "w"  'ace-window)
  ;; clojure / cider
  (evil-define-key 'normal clojure-mode-map
    (kbd "gd") 'cider-jump
    (kbd "K") 'cider-doc
    (kbd "gK") 'cider-javadoc
    ;Evaluate the current toplevel form. PREFIX => print in buffer.
    (kbd "<return>") 'cider-eval-defun-at-point
    (kbd "gX") 'cider-eval-buffer
    (kbd "C-]") 'cider-find-var
    )
  (evil-define-key 'visual clojure-mode-map
    (kbd "r") 'cider-eval-region)
  (evil-define-key 'normal cider-repl-mode-map (kbd "gK") 'cider-javadoc)
  (evil-define-key 'normal cider-mode-map (kbd "gK") 'cider-javadoc)
  )

(use-package clojure-mode
  :commands clojure-mode
  :init
  (add-hook 'clojure-mode-hook (lambda ()
                                 (clj-refactor-mode 1)
                                 ;; (paredit-mode 1)
                                 ;; (yas-minor-mode 1)
                                 ;;(flycheck-clojure-setup)
                                 ))
  :functions put-clojure-indent
  :config
  (setq clojure-indent-style :align-arguments)
  (define-clojure-indent
    ;; Core
    (send-off 1) (cli 1) (go-loop 1)

    ;; Miscellaneous
    (fdef 1) (cli 1) (send-off 1)

    ;; Compojure
    (ANY 2) (GET 2) (POST 2) (PUT 2) (PATCH 2) (DELETE 2)
    (OPTIONS 2) (context 2) (api 2)

    ;; Expect-call
    (expect-call 1))
  )

(use-package cider
  :bind (:map clojure-mode-map
              ("M-]" . cider-find-var)
              ("M-[" . cider-pop-back))
  :config
  (use-package helm-buffers)
  (setq cider-prompt-for-symbol nil
        nrepl-hide-special-buffers t
        cider-use-overlays t)
  (add-to-list 'evil-emacs-state-modes 'cider-stacktrace-mode)
  (add-to-list 'evil-emacs-state-modes 'cider-test-report-mode)
  (add-to-list 'evil-emacs-state-modes 'cider-docview-mode)
  (add-to-list 'helm-boring-buffer-regexp-list "*nrepl-server.*")
  (add-to-list 'helm-boring-buffer-regexp-list "*nrepl-messages.*")
  :diminish cider-mode
  :ensure t)

(use-package find-file-in-project :ensure t)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
        (file-name (buffer-file-name)))
    (if project-dir
        (progn
        (neotree-dir project-dir)
        (neotree-find file-name))
    (message "Could not find git project root."))))

(use-package neotree
  :ensure t
  :config

    (evil-leader/set-key
      "m"  'neotree-toggle
      "n"  'neotree-project-dir)

  (setq projectile-switch-project-action 'neotree-projectile-action)
  (add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
      (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
      (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
      (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
      (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
      (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
      (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
      (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)
      (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))

(use-package ag
  :ensure t
  :config
  (setq ag-reuse-buffers 't)
  (setq ag-reuse-window 't)
  (setq ag-highlight-search t))

(use-package helm-ag
  :ensure t)

(use-package helm-projectile
  :bind (("C-S-P" . helm-projectile-switch-project)
         :map evil-normal-state-map
         ("C-p" . helm-projectile))
  :after (helm projectile evil)
  :commands (helm-projectile helm-projectile-switch-project)
  :ensure t)

(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-idle-delay 0.2)
  (setq company-selection-wrap-around t)
  (define-key company-active-map [tab] 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package smex
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'smex))

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

(use-package robe
  :ensure t
  :config
  (add-hook 'ruby-mode-hook 'robe-mode))

(use-package go-mode
  :ensure t
  :config
  (add-hook
   'go-mode-hook
   (lambda ()
     (add-hook 'before-save-hook 'gofmt-before-save)
     (setq tab-width 4)
     (setq indent-tabs-mode 1))))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(provide 'init-entire)
