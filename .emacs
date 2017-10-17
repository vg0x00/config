
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(setq helm-mode-fuzzy-match t
	  helm-completion-in-region-fuzzy-match t
	  helm-M-x-fuzzy-match t
	  helm-lisp-fuzzy-completion t
	  helm-buffers-fuzzy-matching t)
(helm-mode 1)

(define-key helm-map (kbd "C-f") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)



(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next-or-abort)
  (define-key company-active-map (kbd "C-p") #'company-select-previous-or-abort))


(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
;; (setq inhibit-splash-screen t)
(setq initial-buffer-choice t
	  initial-scratch-message nil
	  initial-major-mode 'text-mode
	  ring-bell-function 'ignore)
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (set-default-font "Fira Code")
  (global-linum-mode t)
  (setq linum-format "%3d"))
(set-face-attribute 'default nil :font "Fira Code Retina-13")
;; (split-window-horizontally)
(setq backup-directory-alist '(("." . "~/Documents/config/emacs/backups"))
      delete-old-versions t
      keep-new-versions 6
      keep-old-versions 4
      version-control t
      auto-save-default nil)
;; disable auto save feature will not create file like: #filename#

(display-time-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
;; (global-hl-line-mode t)
(blink-cursor-mode -1)
(setq-default major-mode 'text-mode)
(add-to-list 'custom-theme-load-path "~/Documents/config/emacs/themes")
(load-theme 'wu t)
;; (load-theme 'darktooth t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; tab indent line or insert tabs be smart
(setq-default indent-tabs-mode t
			  tab-always-indent nil
			  c-basic-offset 4
			  indent-line-function 'insert-tab
			  tab-width 4)
(global-set-key (kbd "RET") 'newline-and-indent)

;; navigation
(global-set-key (kbd "s-w") 'other-window)


;; settings for nand2tetris project
(defun hook-to-mode (mode extension-list)
  (dolist (extension extension-list)
    (add-to-list 'auto-mode-alist
		 (cons extension mode))))
(hook-to-mode 'c-mode (list
					   "\\.hdl$"
					   "\\.tst$"
					   "\\.cmp$"))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(rainbow-delimiters-mode t)

(defun open-nand2tris-hdl-tst-files ()
  "open .hdl and .tst files in the given project sub-diretory"
  (interactive)
  (setq names (split-string (read-string "index file-name: ")))
  (when (equal (length names) 2)
    (setq index (concat (car names) "/"))
    (setq file-name (nth 1 names))
    (setq base-dir-path "~/Downloads/nand2tetris/projects/")
    (save-excursion
      (other-window 1)   	
      (find-file (concat base-dir-path index file-name ".tst"))
      (other-window 1)
      (find-file (concat base-dir-path index file-name ".hdl"))
      )))
(global-set-key (kbd "C-c o") 'open-nand2tris-hdl-tst-files)

(defun run-hardware-simulator ()
  "open hardware simulator from emacs"
  (interactive)
  (call-process "~/Downloads/nand2tetris/tools/HardwareSimulator.sh"))
(global-set-key (kbd "C-c r") 'run-hardware-simulator)

(electric-pair-mode t)					
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#32302F" "#FB4934" "#B8BB26" "#FABD2F" "#83A598" "#D3869B" "#17CCD5" "#EBDBB2"])
 '(custom-safe-themes
   (quote
	("a2923a93d6eb50996f99872be02ac53cebb8e9fa51b6e21775e7017cb40936d4" "2f0a552a9d14fe8ddaaacdb7b82a0eee1ea1f7f5d0850789915e5b04a1b9669f" default)))
 '(package-selected-packages (quote (rainbow-delimiters darktooth-theme company helm)))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
