(deftheme wu)

(custom-theme-set-faces
 'wu
 '(default ((t (:family "Fira Code" :background "#121212" :foreground "ivory4"))))
 
 ;; build in syntax
 '(font-lock-builtin-face ((t (:foreground "honeydew4"))))
 '(font-lock-comment-face ((t (:foreground "#7a8b8b"))))
 '(font-lock-string-face ((t (:foreground "#2aa198" :weight normal))))
 '(font-lock-keyword-face ((t (:foreground "#9AB77C" :weight normal))))
 '(font-lock-function-name-face ((t (:foreground "#ffb5c5" :weight normal))))
 '(font-lock-comment-face ((t (:foreground "DarkSeaGreen4" :weight normal))))
 '(font-lock-doc-face ((t (:foreground "dark cyan" :weight normal))))
 '(font-lock-constant-face ((t (:foreground "#cd919e" :weight normal))))
 '(font-lock-variable-name-face ((t (:foreground "#cdaa7d" :weight normal))))
 '(font-lock-type-face ((t (:foreground "#96cdcd" :weight normal))))
 '(font-lock-preprocessor-face ((t (:foreground "#cd5555" :weight normal))))
 '(font-lock-warning-face ((t (:foreground "#FF0000" :weight bold))))

 ;; compile
 '(compilation-info ((t (:foreground "SeaGreen3" :weight bold))))


 ;; org mode
 '(org-level-1 ((t (:foreground "#c1cdcd" :weight bold))))
 '(org-level-2 ((t (:foreground "#8b8378"))))

 ;; highlight
 '(highlight ((t (:background "MistyRose2"))))
 '(region ((t (:background "MistyRose2"))))

 ;; company
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold))
                           (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold))
                                     (t (:inherit company-tooltip-selection))))
 '(company-scrollbar-bg ((t (:background "#121212"))))
 '(company-scrollbar-fg ((t (:background "#121212"))))
 '(eldoc-highlight-function-argument ((t (:inherit bold :foreground "#00ee76" :underline t :weight bold))))
 ;; whitespace-mode for 80 columns
 '(whitespace-line ((t (:foreground "IndianRed4"))))
 ;; show-paren-mode
 '(show-paren-match-face (( t (:background "firebrick3"))))
)

(provide-theme 'wu)

