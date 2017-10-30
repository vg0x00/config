;;;;;;;;;;;;;;
;; encoding ;;
;;;;;;;;;;;;;;

;; to check current buffer encoding: C-h C
;; at the beginning of mode line: U: multi-byte, 1: ISO character encoding
(prefer-coding-system 'utf-8)           
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
;; line ending style: mode line: U:**-
;; : means Unix style, DOS means Windows style, Mac means Mac

;;;;;;;;;;;;;;;;;;
;; theme & face ;;
;;;;;;;;;;;;;;;;;;

(add-to-list 'custom-theme-load-path "~/Documents/config/emacs/themes")
(load-theme 'wu t)
;;(load-theme 'tango-dark t)

(setq initial-buffer-choice t
      initial-scratch-message nil
      initial-major-mode 'text-mode
      split-height-threshold nil ;;make new window split horizontally
      split-width-threshold 0
      next-line-add-newline t
      ido-enable-flex-matching t ;; ido flex string macthing
      ido-everywhere t
      ring-bell-function 'ignore)

(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (set-default-font "Fira Code")
  (global-linum-mode -1)
  (setq linum-format "%3d"))

(set-face-attribute 'default nil :font "Fira Code Retina-13")
(ido-mode t)
(menu-bar-mode -1)
(display-time-mode t)
(which-function-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode -1)
(column-number-mode t)
(transient-mark-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; delete-selection-mode
;; when selected, any insert will delete selection and insert
;; shift-select-mode
;; mark selection holding shift key, any none-shift key will deactive region
;; cua-mode (IBM common user mode, like Windows shortcuts)

;;;;;;;;;;;;;;;;;
;; file backup ;;
;;;;;;;;;;;;;;;;;

(setq backup-directory-alist '(("." . "~/Documents/config/emacs/backups"))
      delete-old-versions t
      keep-new-versions 6
      keep-old-versions 4
      version-control t
			js-indent-level 2
      python-indent-offset 2
      auto-save-default nil)
;; disable auto save feature will not create file like: #filename#

(setq-default indent-tabs-mode nil
              tab-width 2
              tab-always-indent nil
              c-basic-offset 2
              ;; indent-line-function 'insert-tab
              major-mode 'text-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

;; (load-file "~/.emacs.d/nand2tetris.el")

;;;;;;;;;;;;;;;;;
;; keybindings ;;
;;;;;;;;;;;;;;;;;

;; compile
(global-set-key (kbd "s-r") 'compile)

;; comment and uncomment
(global-set-key (kbd "s-;") 'comment-dwim) ; add comment at the end
(global-set-key (kbd "s-/") 'comment-or-uncomment-region) 
(global-set-key (kbd "s-C-/") 'comment-line)

;; navigation
;; beginning or end of buffer: meta+< meta+>
(global-set-key (kbd "s-w") 'other-window)
(global-set-key (kbd "s-{") 'beginning-of-defun)
(global-set-key (kbd "s-}") 'end-of-defun)
(global-set-key (kbd "s-[") 'previous-error)
(global-set-key (kbd "s-]") 'next-error)

;;;;;;;;;;;;
;; window ;;
;;;;;;;;;;;;

;; C-x 0: close active window
;; C-x 1: close other windows
;; C-x 2: split widow below
;; C-x 3: split window right
;; C-x o: switch to other window (rebinded to s-w)
;; quit window
(global-set-key (kbd "C-q") 'quit-window)
;; jump back from tag mark
(global-set-key (kbd "C-`") 'pop-tag-mark)
;; enable winner mode
;; undo window changes: C-c <-
;; redo window chanegs: C-c ->
(winner-mode t)
;; jump between window using S-left,right,up,down
;; (windmove-default-keybindings) 

;;;;;;;;;;;;
;; frames ;;
;;;;;;;;;;;;

;; not usefull to me.
;; make-frame-command C-x 5 2
;; switch-to-buffer-other-frame
;; delete-frame
;; delete-other-frames
;; search
;; forward: c-s
;; backward: c-r

;;;;;;;;;;;;;;
;; bookmark ;;
;;;;;;;;;;;;;;

;; C-x r b: jump to bookmark
;; C-x r m: make a bookmark
;; C-x r l: list all bookmarks
;; C-x r s: bookmark a region
;; C-x r i: insert region by single mark
;; jump between marks: c-x c-x
(global-set-key (kbd "<s-left>") 'left-word)
(global-set-key (kbd "<s-right>") 'right-word)
(global-set-key (kbd "<s-up>") 'backward-paragraph)
(global-set-key (kbd "<s-down>") 'forward-paragraph)
(global-set-key (kbd "<s-S-left>") 'backward-sexp) ;jump backward to balanced expression, like {}, ""
(global-set-key (kbd "<s-S-right>") 'forward-sexp)
(global-set-key (kbd "s-K") 'kill-sexp) ; kill balanced expression

;;;;;;;;;;
;; mark ;;
;;;;;;;;;;

;; mark function: C-M-h

;; buffer
(global-set-key (kbd "s-b") 'ido-switch-buffer)
(global-set-key (kbd "s-B") 'ido-switch-buffer-other-window)
(global-set-key (kbd "s-k") 'ido-kill-buffer)
(global-set-key (kbd "s-S") 'ido-write-file)
;; C-v: scroll down
;; M-v: scroll up
;; C-M-v: scroll down other window 
;; C-M-S-v: scroll up other window
;; C-l: recenter current position

;; imenu
(global-set-key (kbd "s-i") 'imenu)

;; goto line
(global-set-key (kbd "s-g") 'goto-line)

;; cut & copy(saving to the killing ring) & yank

;; rebind M-x
(global-set-key (kbd "s-x") 'execute-extended-command)

;; open file
(global-set-key (kbd "s-f") 'ido-find-file)
(global-set-key (kbd "s-F") 'ido-find-file-other-window)

;; universal paramters
;; C-0 - C-9: digital param

;; C-u: 4
;; C-u C-u: 4 * 4
;; C-- or M--: negative param

;; edit
;; delete word ←: M-- M-d
;; delete word →: M-d
;; delete char ←: C-- C-d
;; delete char →: C-d

;;;;;;;;;;;;;;;;
;; emacs info ;;
;;;;;;;;;;;;;;;;

;; [ and ]: pre/next node
;; l and r: history back & forward
;; n and p: pre/next sidling node
;; u or ^: go up (parent) node <OUT>
;; tab: cycle through links
;; m + name: open the "name" menu <IN>

;; cursor position info: suck as font face:
;; C-u C-x = (what-cursor-position with prefix shows detail info)

;;;;;;;;;;;;;;;;
;; emacs help ;;
;;;;;;;;;;;;;;;;

(add-hook 'help-mode-hook
          (lambda () (progn (local-set-key (kbd "C-c b") 'help-go-back)
                            (local-set-key (kbd "C-c f") 'help-go-forward))))
;; apropos
;; command by keywords apropos-command (C-h a)
;; document by keywords apropos-document (C-h d)

;; describe system
;; C-h m: describe mode
;; C-h f: describe function
;; C-h v: describe variable
;; C-h k: describe key


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto completion: company mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; company-mode (company mode is enabled only in elisp-mode and go-mode)
(add-to-list 'load-path "/Users/vg0x00/Documents/config/emacs/elisp/company-mode")
(require 'company)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-f") 'company-complete-selection)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


;;;;;;;;;;;;;;;;
;; elisp mode ;;
;;;;;;;;;;;;;;;;

(add-hook 'emacs-lisp-mode-hook
          (lambda () (progn
                       (set (make-local-variable 'company-backends) '(company-elisp))
                       (company-mode))))

;;;;;;;;;;;;
;; golang ;;
;;;;;;;;;;;;

;; go-mode
(setq gofmt-command "goimports")
(add-to-list 'load-path "/Users/vg0x00/Documents/config/emacs/elisp/go-mode.el")
(require 'go-mode-load)
(add-to-list 'exec-path "/Users/vg0x00/Documents/dev/gocode/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

;; go-eldoc
(add-to-list 'load-path "/Users/vg0x00/Documents/config/emacs/elisp/emacs-go-eldoc")
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; go-guru
(require 'go-guru)
(add-hook 'go-mode-hook 'go-guru-hl-identifier-mode)

;; company-go
(add-to-list 'load-path "/Users/vg0x00/Documents/config/emacs/elisp/company-go.el")
(require 'company-go)

;; go-mode local keybindings
(add-hook 'go-mode-hook
          (lambda () (progn
                       (local-set-key (kbd "C-c d") 'go-guru-describe)
                       (local-set-key (kbd "C-c j") 'go-guru-definition)
                       (local-set-key (kbd "C-c J") 'go-guru-definition-other-window)
                       ;show possible error value for selected error
                       (local-set-key (kbd "C-c e") 'go-guru-whicherrs)
                       ;show pointer may point to
                       (local-set-key (kbd "C-c p") 'go-guru-pointsto) 
                       (local-set-key (kbd "C-c c") 'go-guru-callees)
                       (local-set-key (kbd "C-c C") 'go-guru-callers)
                       ;show possible path from main.go
                       (local-set-key (kbd "C-c s") 'go-guru-callstack)
                       ;parameters you need to make a new function according to selection
                       (local-set-key (kbd "C-c v") 'go-guru-freevars) 
                       (local-set-key (kbd "C-c r") 'go-guru-referrers)
                       ;show send/receive corresponding to selected channel
                       (local-set-key (kbd "C-c P") 'go-guru-peers) 
                       (local-set-key (kbd "C-c C-i") 'go-goto-imports)
                       (local-set-key (kbd "C-c C-a") 'go-goto-arguments)
                       (local-set-key (kbd "C-c C-r") 'go-goto-return-values)
                       (local-set-key (kbd "C-c C-f") 'go-goto-function-name)
                       ;adding a pair of parentheses if no method receiver exists
                       (local-set-key (kbd "C-c C-m") 'go-goto-method-receiver)
                       ;using go-eldoc for simple info, show source code document
                       (local-set-key (kbd "C-c C-d") 'godoc-at-point) 
                       ;; prefix c-u will skip anonymous function
                       ;; only enable company mode in go-mode
                       (set (make-local-variable 'company-backends) '(company-go))
                       (set (make-local-variable 'compile-command) "go run main.go")
                       (setq-local compilation-read-command nil) ;; disable for prompt
                       (company-mode)
                       )))
