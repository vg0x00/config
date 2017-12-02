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

(setq initial-buffer-choice t
      initial-scratch-message nil
      initial-major-mode 'text-mode
      split-height-threshold nil ;;make new window split horizontally
      split-width-threshold 0
      next-line-add-newline t
      ido-enable-flex-matching t ;; ido flex string macthing
      ido-everywhere t
      org-support-shift-select t
      ring-bell-function 'ignore)

(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (set-default-font "Fira Code")
  (global-linum-mode -1)
  (setq linum-format "%3d"))

(set-face-attribute 'default nil :font "Fira Code Retina-11.5")

;; balance parentheses - show-paren-mode
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
(setq show-paren-delay 0)

(ido-mode t)
(menu-bar-mode -1)
(display-time-mode t)
(which-function-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode -1)
(column-number-mode t)
(transient-mark-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (delete-selection-mode t)
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
              truncate-lines t
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
(global-set-key (kbd "s-/") 'comment-line)

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
;; (global-set-key (kbd "C-c C-q") 'delete-window) 
;; jump back from tag mark
(global-set-key (kbd "C-`") 'pop-tag-mark)

;; enable winner mode
;; undo window changes: C-c <-
;; redo window chanegs: C-c ->
(winner-mode t)

;; window navigation
;; cause there can only be two windows, so disable window navigation keybindings.
;; (global-set-key (kbd "<C-s-268632091>") 'windmove-up)
;; (global-set-key (kbd "C-s-;") 'windmove-left)
;; (global-set-key (kbd "C-s-'") 'windmove-right)
;; (global-set-key (kbd "C-s-/") 'windmove-down)


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
(global-set-key (kbd "s-n") 'forward-paragraph)
(global-set-key (kbd "s-p") 'backward-paragraph)
(global-set-key (kbd "s-b") 'left-word)
(global-set-key (kbd "s-f") 'right-word)

;; occur search: show pared position list
(global-set-key (kbd "C-S-s") 'occur)

;;;;;;;;;;;;;;
;; bookmark ;;
;;;;;;;;;;;;;;

;; C-x r b: jump to bookmark
;; C-x r m: make a bookmark
;; C-x r l: list all bookmarks
;; C-x r s: bookmark a region
;; C-x r i: insert region by single mark
;; jump between marks: c-x c-x
;; (global-set-key (kbd "<s-left>") 'left-word)
;; (global-set-key (kbd "<s-right>") 'right-word)
;; (global-set-key (kbd "<s-up>") 'backward-paragraph)
;; (global-set-key (kbd "<s-down>") 'forward-paragraph)
;; ;jump backward to balanced expression, like {}, ""
(global-set-key (kbd "<s-S-left>") 'backward-sexp) 
(global-set-key (kbd "<s-S-right>") 'forward-sexp)
(global-set-key (kbd "s-K") 'kill-sexp) ; kill balanced expression

;;;;;;;;;;
;; mark ;;
;;;;;;;;;;

;; mark function: C-M-h

;; buffer
(global-set-key (kbd "<escape> b") 'ido-switch-buffer)
(global-set-key (kbd "<escape> k") 'ido-kill-buffer)
(global-set-key (kbd "<escape> S") 'ido-write-file)
(defun init-window ()
  (interactive)
  (if (> 2 (length (window-list)))
      (split-window-horizontally)
    nil))

(init-window)
(setq split-window-preferred-function 'nil) ;never split window

;; ido mode KEY
;; C-f: accept what you have typed so far 
;; C-j: drop you back to regular open file
;; C-v: scroll down
;; M-v: scroll up
;; C-M-v: scroll down other window 
;; C-M-S-v: scroll up other window
;; C-l: recenter current position

;;;;;;;;;;;;;
;; ibuffer ;;
;;;;;;;;;;;;;

;; revert buffer
(global-set-key (kbd "<escape> r") 'revert-buffer)

(global-set-key (kbd "C-x b") 'ibuffer)
;; group ibuffer by name and mode
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("org" (name . "^.*org$"))
               ("web" (or (mode . web-mode) (mode . js2-mode)))
               ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
               ("programming" (or (mode . python-mode)
                                  (mode . c++-mode)
                                  (mode . elisp-mode)))
               ("emacs" (or (name . "^\\*scratch\\*$")
                            (name . "^\\*Messages\\*$")
                            (name . "^\\.emacs$")))
               ))))
(add-hook 'ibuffer-mode-hook
          (lambda () (ibuffer-auto-mode t)
            (ibuffer-switch-to-saved-filter-groups "default")))
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-expert t)                 ;do not comfirm delete
               

;; imenu
(global-set-key (kbd "s-i") 'imenu)

;; goto line
(global-set-key (kbd "s-g") 'goto-line)

;; cut & copy(saving to the killing ring) & yank

;; rebind M-x
(global-set-key (kbd "s-x") 'execute-extended-command)

;; open file
;;(global-set-key (kbd "s-f") 'ido-find-file)
;;(global-set-key (kbd "s-F") 'ido-find-file-other-window)
(global-set-key (kbd "<escape> f") 'ido-find-file)

;; universal paramters
;; C-0 - C-9: digital param

;; C-u: 4
;; C-u C-u: 4 * 4
;; C-- or M--: negative param

;; edit
;; delete word ←: M-- M-d
;; delete word →: M-d
;; delete word <-: s-backspace
;; kill sentence: M-k
;; swap word: M-t -----> word1: <> word2, <> means cursor position
(global-set-key (kbd "<s-backspace>") 'backward-kill-word)
(global-set-key (kbd "s-d") 'kill-word)
(global-set-key (kbd "S-C-k") 'kill-whole-line)
(global-set-key (kbd "s-%") 'query-replace-regexp)

;; delete char ←: C-- C-d
;; delete char →: C-d
;; kill untile line end: C-k
;; kill untile sentence end: M-k
;; upcase-word: 
(global-set-key (kbd "s-6") 'upcase-word)
(global-set-key (kbd "s-^") 'capitalize-word)
;; query replace
(global-set-key (kbd "s-%") 'query-replace)

;; undo
;; undo: C-/
;; undo: C-x u
;; undo: C-_

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
;; C-h a: apropos-command


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto completion: company mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; basic completion based on buffer
(global-set-key (kbd "s-\\") 'hippie-expand)

;; company-mode (company mode is enabled only in elisp-mode and go-mode)
(add-to-list 'load-path
             "/Users/vg0x00/Documents/config/emacs/elisp/company-mode")
(require 'company)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-f") 'company-complete-selection)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


;;;;;;;;;;;;;;;;;
;; elisp mode ;;
;;;;;;;;;;;;;;;;;
(add-hook 'emacs-lisp-mode-hook
          (lambda () (progn
                       (set (make-local-variable 'company-backends)
                            '(company-elisp))
                       (company-mode))))

;;;;;;;;;;;;;
;; cc mode ;;
;;;;;;;;;;;;;
(add-hook 'c++-mode-hook
          (lambda () (progn
                       (setq-local compile-command "/bin/bash ./build.sh")
                       (setq-local compilation-read-command nil))))

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
(add-to-list 'load-path
             "/Users/vg0x00/Documents/config/emacs/elisp/emacs-go-eldoc")
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; go-guru
(require 'go-guru)
(add-hook 'go-mode-hook 'go-guru-hl-identifier-mode)

;; company-go
(add-to-list 'load-path
             "/Users/vg0x00/Documents/config/emacs/elisp/company-go.el")
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

;;;;;;;;;;;
;; cmake ;;
;;;;;;;;;;;

(add-to-list 'load-path "/Users/vg0x00/Documents/config/emacs/elisp/cmake.el")
;; tips: generate a auto-load file using command: update-file-autoloads
(require 'cmake-mode-load)
(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       auto-mode-alist))

;;;;;;;;;;;;;;;;;;;
;; Font FiraCode ;;
;;;;;;;;;;;;;;;;;;;

;; This works when using emacs --daemon + emacsclient
;; (add-hook 'after-make-frame-functions
;; (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))
;; This works when using emacs without server/client
(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
;; I haven't found one statement that makes both of the above situations work,
;; so I use both for now

(defconst fira-code-font-lock-keywords-alist
  (mapcar (lambda (regex-char-pair)
            `(,(car regex-char-pair)
              (0 (prog1 ()
                   (compose-region (match-beginning 1)
                                   (match-end 1)
                                   ;; The first argument to concat is a string containing a literal tab
                                   ,(concat "	" (list (decode-char 'ucs (cadr regex-char-pair)))))))))
          '(("\\(www\\)"                   #Xe100)
            ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
            ("\\(\\*\\*\\*\\)"             #Xe102)
            ("\\(\\*\\*/\\)"               #Xe103)
            ("\\(\\*>\\)"                  #Xe104)
            ("[^*]\\(\\*/\\)"              #Xe105)
            ("\\(\\\\\\\\\\)"              #Xe106)
            ("\\(\\\\\\\\\\\\\\)"          #Xe107)
            ("\\({-\\)"                    #Xe108)
            ("\\(\\[\\]\\)"                #Xe109)
            ("\\(::\\)"                    #Xe10a)
            ("\\(:::\\)"                   #Xe10b)
            ("[^=]\\(:=\\)"                #Xe10c)
            ("\\(!!\\)"                    #Xe10d)
            ("\\(!=\\)"                    #Xe10e)
            ("\\(!==\\)"                   #Xe10f)
            ("\\(-}\\)"                    #Xe110)
            ("\\(--\\)"                    #Xe111)
            ("\\(---\\)"                   #Xe112)
            ("\\(-->\\)"                   #Xe113)
            ("[^-]\\(->\\)"                #Xe114)
            ("\\(->>\\)"                   #Xe115)
            ("\\(-<\\)"                    #Xe116)
            ("\\(-<<\\)"                   #Xe117)
            ("\\(-~\\)"                    #Xe118)
            ("\\(#{\\)"                    #Xe119)
            ("\\(#\\[\\)"                  #Xe11a)
            ("\\(##\\)"                    #Xe11b)
            ("\\(###\\)"                   #Xe11c)
            ("\\(####\\)"                  #Xe11d)
            ("\\(#(\\)"                    #Xe11e)
            ("\\(#\\?\\)"                  #Xe11f)
            ("\\(#_\\)"                    #Xe120)
            ("\\(#_(\\)"                   #Xe121)
            ("\\(\\.-\\)"                  #Xe122)
            ("\\(\\.=\\)"                  #Xe123)
            ("\\(\\.\\.\\)"                #Xe124)
            ("\\(\\.\\.<\\)"               #Xe125)
            ("\\(\\.\\.\\.\\)"             #Xe126)
            ("\\(\\?=\\)"                  #Xe127)
            ("\\(\\?\\?\\)"                #Xe128)
;;            ("\\(;;\\)"                    #Xe129)
            ("\\(/\\*\\)"                  #Xe12a)
            ("\\(/\\*\\*\\)"               #Xe12b)
            ("\\(/=\\)"                    #Xe12c)
            ("\\(/==\\)"                   #Xe12d)
            ("\\(/>\\)"                    #Xe12e)
            ("\\(//\\)"                    #Xe12f)
            ("\\(///\\)"                   #Xe130)
            ("\\(&&\\)"                    #Xe131)
            ("\\(||\\)"                    #Xe132)
            ("\\(||=\\)"                   #Xe133)
            ("[^|]\\(|=\\)"                #Xe134)
            ("\\(|>\\)"                    #Xe135)
            ("\\(\\^=\\)"                  #Xe136)
            ("\\(\\$>\\)"                  #Xe137)
            ("\\(\\+\\+\\)"                #Xe138)
            ("\\(\\+\\+\\+\\)"             #Xe139)
            ("\\(\\+>\\)"                  #Xe13a)
            ("\\(=:=\\)"                   #Xe13b)
            ("[^!/]\\(==\\)[^>]"           #Xe13c)
            ("\\(===\\)"                   #Xe13d)
            ("\\(==>\\)"                   #Xe13e)
            ("[^=]\\(=>\\)"                #Xe13f)
            ("\\(=>>\\)"                   #Xe140)
            ("\\(<=\\)"                    #Xe141)
            ("\\(=<<\\)"                   #Xe142)
            ("\\(=/=\\)"                   #Xe143)
            ("\\(>-\\)"                    #Xe144)
            ("\\(>=\\)"                    #Xe145)
            ("\\(>=>\\)"                   #Xe146)
            ("[^-=]\\(>>\\)"               #Xe147)
            ("\\(>>-\\)"                   #Xe148)
            ("\\(>>=\\)"                   #Xe149)
            ("\\(>>>\\)"                   #Xe14a)
            ("\\(<\\*\\)"                  #Xe14b)
            ("\\(<\\*>\\)"                 #Xe14c)
            ("\\(<|\\)"                    #Xe14d)
            ("\\(<|>\\)"                   #Xe14e)
            ("\\(<\\$\\)"                  #Xe14f)
            ("\\(<\\$>\\)"                 #Xe150)
            ("\\(<!--\\)"                  #Xe151)
            ("\\(<-\\)"                    #Xe152)
            ("\\(<--\\)"                   #Xe153)
            ("\\(<->\\)"                   #Xe154)
            ("\\(<\\+\\)"                  #Xe155)
            ("\\(<\\+>\\)"                 #Xe156)
            ("\\(<=\\)"                    #Xe157)
            ("\\(<==\\)"                   #Xe158)
            ("\\(<=>\\)"                   #Xe159)
            ("\\(<=<\\)"                   #Xe15a)
            ("\\(<>\\)"                    #Xe15b)
            ("[^-=]\\(<<\\)"               #Xe15c)
            ("\\(<<-\\)"                   #Xe15d)
            ("\\(<<=\\)"                   #Xe15e)
            ("\\(<<<\\)"                   #Xe15f)
            ("\\(<~\\)"                    #Xe160)
            ("\\(<~~\\)"                   #Xe161)
            ("\\(</\\)"                    #Xe162)
            ("\\(</>\\)"                   #Xe163)
            ("\\(~@\\)"                    #Xe164)
            ("\\(~-\\)"                    #Xe165)
            ("\\(~=\\)"                    #Xe166)
            ("\\(~>\\)"                    #Xe167)
            ("[^<]\\(~~\\)"                #Xe168)
            ("\\(~~>\\)"                   #Xe169)
            ("\\(%%\\)"                    #Xe16a)
           ;; ("\\(x\\)"                   #Xe16b) This ended up being hard to do properly so i'm leaving it out.
            ("[^:=]\\(:\\)[^:=]"           #Xe16c)
            ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
            ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f))))

(defun add-fira-code-symbol-keywords ()
  (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))

(add-hook 'prog-mode-hook
          #'add-fira-code-symbol-keywords)


;;;;;;;;;;;;;;;;;;;;;
;; whitespace mode ;;
;;;;;;;;;;;;;;;;;;;;;
(setq-default
 whitespace-line-column 80
 whitespace-style       '(face lines-tail))
(add-hook 'prog-mode-hook #'whitespace-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; novel: read-only mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq auto-mode-alist
      (append
       '((".*_const\\.txt\\'" . read-only-mode))
       auto-mode-alist))

;;;;;;;;;;;;;;;;;
;; trmp-mode  ;;
;;;;;;;;;;;;;;;;;
(add-hook 'tramp-mode-hook
          (setq tramp-terminal-prompt-regexp ".*\ \>$"))

;;;;;;;;;;;;;;;;;;;;;
;; version control ;;
;;;;;;;;;;;;;;;;;;;;;
;; diff working file
(global-set-key (kbd "<escape> v =") 'vc-diff)
;; diff working tree
(global-set-key (kbd "<escape> v t") 'vc-root-diff)
;; show pervious version file content
(global-set-key (kbd "<escape> v p") 'vc-revision-other-window)
;; show file history log
(global-set-key (kbd "<escape> v l") 'vc-print-log)
(global-set-key (kbd "<escape> v L") 'vc-print-root-log)
;; pull and push
(global-set-key (kbd "<escape> v u") 'vc-update) ;sync current working tree
(global-set-key (kbd "<escape> v p") 'vc-push)
;; show push log
(global-set-key (kbd "<escape> v i") 'vc-log-incoming) ;what will pull
(global-set-key (kbd "<escape> v o") 'vc-log-outgoing) ;what will push
;; revert changes, discard all changes, can not UNDO !
(global-set-key (kbd "<escape> v r") 'vc-revert)
;; add file to ignore
(global-set-key (kbd "<escape> v I") 'vc-ignore)
;; merge
(global-set-key (kbd "<escape> v m") 'vc-merge)
;; remote file from working tree
(global-set-key (kbd "<escape> v d") 'vc-delete-file)
;; rename file
(global-set-key (kbd "<escape> v R") 'vc-rename-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; regular expression in Emacs ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; default as meta character unless using \
;; \|   alternertive
;; \(,\) group
;; \{,\} repeatition
;; \sxxxx search include xxxx (emacs only)
;; \Sxxxx search not include xxxx (emacs only)
;; - whtiespace
;; w word
;; _ word and synbol
;; .
;; () {} [] group
;; \,(elisp-function ...)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bright FIXME and NOTE ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(make-face 'font-lock-fixme-face)
(make-face 'font-lock-note-face)
(modify-face 'font-lock-fixme-face "firebrick3" nil nil t nil nil nil nil)
(modify-face 'font-lock-note-face "DeepSkyBlue2" nil nil t nil nil nil nil)

(add-hook 'prog-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
             '(("\\<\\(FIXME\\):" 1 'font-lock-fixme-face prepend)
               ("\\<\\(NOTE\\):" 1 'font-lock-note-face prepend)))))

;; load config file
(defun load-user-config (file-name)
  (interactive "f")
  "Load user config file from the default eamcs directory"
  (load-file (expand-file-name file-name user-emacs-directory)))
(load-user-config "code-style.el")  ; style name: vg0x00
(setq c-default-style
      '((java-mode . "java")
        (awk-mode . "awk")
        (c-mode . "vg0x00")
        (c++-mode . "vg0x00")
        (asm-mode . "vg0x00")
        (other . "gnu")))
