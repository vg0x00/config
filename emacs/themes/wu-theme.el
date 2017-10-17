(deftheme wu)

(custom-theme-set-faces
 'wu
 '(default ((t (:family "Fira Code" :background "#121212" :foreground "#7395AA"))))
 '(font-lock-comment-face ((t (:foreground "#747D71"))))
 '(region ((t (:background "#ffcccc"))))
 '(font-lock-string-face ((t (:foreground "#4FAA79" :weight normal))))
 '(font-lock-keyword-face ((t (:foreground "#9AB77C" :weight normal))))
 '(font-lock-function-name-face ((t (:foreground "#9AB77C" :weight normal))))
 '(font-lock-comment-face ((t (:foreground "DarkSeaGreen4" :weight normal))))
 '(font-lock-doc-face ((t (:foreground "dark cyan" :weight normal))))
 '(font-lock-constant-face ((t (:foreground "#cd919e" :weight normal))))
;;  '(font-lock-variable-name-face ((t (:foreground "sienna" :weight normal))))
 '(font-lock-type-face ((t (:foreground "#96cdcd" :weight bold))))
 '(font-lock-preprocessor-face ((t (:foreground "light sea green" :weight normal))))
)

(provide-theme 'wu)

