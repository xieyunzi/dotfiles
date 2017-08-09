(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (setq evil-leader/in-all-states 1)
  (evil-leader/set-key
    "f"  'helm-find-files
    "m"  'neotree-toggle
    "n"  'neotree-project-dir
    "."  'switch-to-previous-buffer
    "/"  'evil-search-highlight-persist-remove-all
    "h"  'help-map
    "ag" 'helm-projectile-ag
    "pa" 'helm-projectile-find-file-in-known-projects
    "z" 'zoom-window-zoom
    "be" (lambda () (interactive) (bookmark-jump "emacs"))
    "w"  'ace-window))

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

(powerline-default-theme)

(provide 'init-entire)
