;;; Liu, Bingxin emacs configuration

(org-babel-load-file (expand-file-name "~/.config/emacs/lbx-emacs-config.org"))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" default))
 '(package-selected-packages
   '(auto-complete-config undo-tree yasnippet jedi flycheck gruvbox-theme auto-complete ace-window which-key try use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(whitespace-tab ((t (:foreground "#636363")))))


