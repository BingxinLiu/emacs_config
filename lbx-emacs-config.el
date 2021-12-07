(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" .  "https://melpa.org/packages/"))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; UI SETTING:
;; tell emacs where to find gruvbox-theme
;(add-to-list 'custom-theme-load-path "~/.config/emacs")
;(load-theme 'gruvbox t)
(use-package gruvbox-theme
  :ensure t
  :init (load-theme 'gruvbox-dark-soft t))

(setq inhibit-startup-message t)
(tool-bar-mode -1)
;; make a tab bar
;; bad looking
;; (use-package tabbar
;;   :ensure t
;;   :config (tabbar-mode 1))

(setq custom-tab-width 4)

(global-set-key (kbd "<f5>") 'revert-buffer)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))


;; pompt up hints for file
;; conflict with swiper
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

;; depend by swiper
(use-package counsel
  :ensure t)
;; swiper
(use-package swiper
  :ensure try
  :config (progn (ivy-mode 1)
		 (setq ivy-use-virtual-buffers t)
		 (global-set-key "\C-s" 'swiper)
		 (global-set-key (kbd "C-c C-r") 'ivy-resume)
;		 (global-set-key (kbd "<f6>") 'ivy-resume)
		 (global-set-key (kbd "M-x") 'counsel-M-x)
;		 (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;		 (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;		 (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;		 (global-set-key (kbd "<f1> l") 'counsel-load-library)
;		 (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;		 (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;		 (global-set-key (kbd "C-c g") 'counsel-git)
;		 (global-set-key (kbd "C-c j") 'counsel-git-grep)
;		 (global-set-key (kbd "C-c k") 'counsel-ag)
;		 (global-set-key (kbd "C-x l") 'counsel-locate)
;		 (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
		 (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
		 ))
;; avy enhance search
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;; auto-complete
(use-package auto-complete
  :ensure t
  :init (progn (ac-config-default)
	       (global-auto-complete-mode t)
	       ))

;; show a list of buffers in current window.
;; you can tap keys like D to delete a buffer and tanp X to execute it
(defalias 'list-buffers 'ibuffer)
;; list buffers in a new window
;; (defalias 'list-buffers 'ibuffer-other-window)

(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode))

(global-hl-line-mode t)

; flashes the cursor's line when you scroll
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  ;; set color like below:
  ;; (setq beacon-color "#666600")
  )

(use-package expand-region
  :ensure t
  :config (global-set-key (kbd "C-=") 'er/expand-region))

(use-package iedit
  :ensure t)

;;; package --- setting up flycheck
;;; Commentary: flycheck
;;; Code:
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)

  (global-company-mode t))

;; require eglot to work with clangd
 ;    (use-package 'eglot)
 ;    (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;     (add-hook 'c-mode-hook 'eglot-ensure)
;     (add-hook 'c++-mode-hook 'eglot-ensure)

;     (setq lsp-clangd-executable "clangd")
;     (setq lsp-clients-clangd-executable "clangd")

(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;; WINDOWS MANAGE:
;; undo and redo tree of windows configuration
(winner-mode 1)
;; using shift + arrow key to move between windows
(windmove-default-keybindings)
;; Give you a number to navigate to a specific window
(use-package ace-window
  :ensure t
  :init (progn (global-set-key [remap other-window] 'ace-window)
	       (custom-set-faces `(aw-leading-char-face
				   ((t (:inherit ace-jump-face-foreground :height 3.0)))))
	       ))
