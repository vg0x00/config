;; window config
(setq inhibit-splash-screen t
      inhibit-startup-message t
      initial-scratch-message nil)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-linum-mode t)
(prefer-coding-system 'utf-8)
(split-window-horizontally)
(setq backup-directory-alist '(("." . "~/Documents/config/emacs/backups")))
(setq delete-old-versions -1)
(display-time-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(global-hl-line-mode t)
(blink-cursor-mode -1)
(setq-default major-mode 'text-mode)
(add-to-list 'custom-theme-load-path "~/Documents/config/emacs/themes")
(load-theme 'wu t)

;; tab indent line or insert tabs be smart
(setq indent-tabs-mode t
      tab-always-indent nil
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


