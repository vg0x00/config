
;; UTF-8 
(prefer-coding-system 'utf-8)           
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(setq initial-buffer-choice t
      initial-scratch-message nil
      initial-major-mode 'text-mode
      ring-bell-function 'ignore)

(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (set-default-font "Fira Code")
  (global-linum-mode -1)
  (setq linum-format "%3d"))

(set-face-attribute 'default nil :font "Fira Code Retina-13")

;; backup file
(setq backup-directory-alist '(("." . "~/Documents/config/emacs/backups"))
      delete-old-versions t
      keep-new-versions 6
      keep-old-versions 4
      version-control t
			js-indent-level 2
      auto-save-default nil)
;; disable auto save feature will not create file like: #filename#

(display-time-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode -1)
(transient-mark-mode -1)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; tab indent line or insert tabs be smart
(setq-default indent-tabs-mode nil
              tab-width 2
              tab-always-indent nil
              c-basic-offset 2
              ;; indent-line-function 'insert-tab
              major-mode 'text-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

;; navigation
(global-set-key (kbd "s-w") 'other-window)

;; (load-file "~/.emacs.d/nand2tetris.el")

;; load customize theme -> wu
(add-to-list 'custom-theme-load-path "~/Documents/config/emacs/themes")
(load-theme 'wu t)
;;(load-theme 'tango-dark t)
