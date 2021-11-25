;;; Liu, Bingxin emacs configuration

(org-babel-load-file (expand-file-name "~/.config/emacs/lbx-emacs-config.org"))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

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


;;; UI SETTING:
;; tell emacs where to find gruvbox-theme
;(add-to-list 'custom-theme-load-path "~/.config/emacs")
;(load-theme 'gruvbox t)
(use-package gruvbox-theme
  :ensure t
  :init (load-theme 'gruvbox-dark-soft t))


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

;; make a tab bar
;; bad looking
;; (use-package tabbar
;;   :ensure t
;;   :config (tabbar-mode 1))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" default))
 '(package-selected-packages
   '(gruvbox-theme auto-complete ace-window which-key try use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(whitespace-tab ((t (:foreground "#636363")))))


