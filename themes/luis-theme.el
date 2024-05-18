;; Package-Requires: ((emacs "24"))

(unless (>= emacs-major-version 24)
  (error "The luis theme requires Emacs 24 or later!"))

(deftheme luis "The naysayer color theme")

;; Monokai colors
(defcustom naysayer-theme-yellow "#E6DB74" "Primary colors - yellow" :type 'string :group 'monokai)
(defcustom naysayer-theme-orange "#FD971F" "Primary colors - orange" :type 'string :group 'monokai)
(defcustom naysayer-theme-red "#F92672" "Primary colors - red" :type 'string :group 'monokai)
(defcustom naysayer-theme-magenta "#FD5FF0" "Primary colors - magenta" :type 'string :group 'monokai)
(defcustom naysayer-theme-blue "#66D9EF" "Primary colors - blue" :type 'string :group 'monokai)
(defcustom naysayer-theme-green "#A6E22E" "Primary colors - green" :type 'string :group 'monokai)
(defcustom naysayer-theme-cyan "#A1EFE4" "Primary colors - cyan" :type 'string :group 'monokai)
(defcustom naysayer-theme-violet "#AE81FF" "Primary colors - violet" :type 'string :group 'monokai)

(let (
      ;; (background "#0E1415") more of a grey spacey look
      (background "#051717")
      (gutters    "#062329")
      (gutter-fg  "#062329")
      (gutters-active "#062329")
      (builtin      "#CECECE")
      (selection  "#293334")
      (text       "#CECECE")
      (comments   "#999999")
      (types     "#CECECE")
      
      ;; (types     "#FAFAFA")
      ;;(keywords  "#708B8D") 
      (keywords  "#2ec09c") 
      (variables "#CECECE")
      (functions "#bebb8c")
      (methods    "#CECECE")
      (strings    "#2ec09c")
      (printf-specifiers "#00ffa2")
      (operators "#708B8D")
      (constants  "#CECECE")
      (macros "#d6a360")
      (numbers "#7ad0c6")
      (white     "#ffffff")
      (warning "#ff0000")
      (error   "#ffaa00")
      (highlight-line "#0b3335")
      (line-fg "#126367"))

  (custom-theme-set-faces
   'luis

   ;; Default colors
   ;; *****************************************************************************

   `(default                          ((t (:foreground ,text :background ,background, :weight normal))))
   `(region                           ((t (:foreground nil :background ,selection))))
   `(cursor                           ((t (:background ,white                        ))))
   `(fringe                           ((t (:background ,background   :foreground ,white))))
   `(linum                            ((t (:background ,background :foreground ,gutter-fg))))
   `(highlight ((t (:foreground nil :background ,selection))))

   ;; Font lock faces
   ;; *****************************************************************************

   `(font-lock-keyword-face           ((t (:foreground ,keywords))))
   `(font-lock-type-face              ((t (:foreground ,types))))
   `(font-lock-format-specifier-face  ((t (:foreground ,printf-specifiers))))
   `(font-lock-operator-face          ((t (:foreground ,operators))))


   
   ;; `(font-lock-operator-face          ((t (:foreground ,types)))) ;; luis added this
   `(font-lock-constant-face          ((t (:foreground ,constants))))
   `(font-lock-variable-name-face     ((t (:foreground ,variables))))
   `(font-lock-builtin-face           ((t (:foreground ,builtin))))
   `(font-lock-string-face            ((t (:foreground ,strings))))
   `(font-lock-comment-face           ((t (:foreground ,comments))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comments))))
   `(font-lock-doc-face               ((t (:foreground ,comments))))
   `(font-lock-function-name-face     ((t (:foreground ,functions))))
   `(font-lock-doc-string-face        ((t (:foreground ,strings))))
   `(font-lock-preprocessor-face      ((t (:foreground ,macros))))
   `(font-lock-warning-face           ((t (:foreground ,warning))))

   `(compilation-error             ((t (:foreground "DarkOrange"))))
   `(compilation-warning           ((t (:foreground ,text))))


   `(isearch        ((t (:foreground ,background :background ,keywords))))
   `(lazy-highlight ((t (:foreground ,background :background ,text))))
   `(isearch-fail   ((t (:foreground ,warning    :background ,background))))


   ;; Plugins
   ;; *****************************************************************************
   `(trailing-whitespace ((t (:foreground nil :background ,warning))))
   `(whitespace-trailing ((t (:background nil :foreground ,warning :inverse-video t))))
   
   `(which-func ((t (:foreground "#000000"))))
   

   `(linum ((t (:foreground ,line-fg :background ,background))))
   `(linum-relative-current-face ((t (:foreground ,white :background ,background))))
   `(line-number ((t (:foreground ,line-fg :background ,background))))
   `(line-number-current-line ((t (:foreground ,white :background ,background))))

   ;; hl-line-mode
   `(hl-line ((t (:background ,highlight-line))))
   `(hl-line-face ((t (:background ,highlight-line))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,naysayer-theme-violet))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,naysayer-theme-blue))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,naysayer-theme-green))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,naysayer-theme-yellow))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,naysayer-theme-orange))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,naysayer-theme-red))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,naysayer-theme-violet))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,naysayer-theme-blue))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,naysayer-theme-green))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,naysayer-theme-yellow))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,naysayer-theme-orange))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,naysayer-theme-red))))

   ;; mode-line and powerline
   `(mode-line-buffer-id ((t (:foreground ,background :distant-foreground ,text :text ,text :weight bold))))
   `(mode-line ((t (:inverse-video unspecified
                                   :underline unspecified
                                   :foreground ,background
                                   :background ,text
                                   :box nil))))

   `(minibuffer-prompt ((t (:background ,background :foreground ,macros))))
   `(ido-subdir        ((t (:background ,background :foreground ,macros))))
   `(ido-only-match    ((t (:background ,background :foreground ,printf-specifiers))))
   `(ido-first-match   ((t (:background ,background :foreground ,printf-specifiers))))
   
   `(powerline-active1 ((t (:background ,text :foreground ,background))))
   `(powerline-active2 ((t (:background ,text :foreground ,background))))

   `(mode-line-inactive ((t (:inverse-video unspecified
                                            :underline unspecified
                                            :foreground ,text
                                            :background ,background
                                            :box nil))))
   `(powerline-inactive1 ((t (:background ,background :foreground ,text))))
   `(powerline-inactive2 ((t (:background ,background :foreground ,text))))

    ;; better compatibility with default DOOM mode-line
   `(error ((t (:foreground nil :weight normal))))
   `(doom-modeline-project-dir ((t (:foreground nil :weight bold))))
   
   ;; js2-mode
   `(js2-function-call ((t (:inherit (font-lock-function-name-face)))))
   `(js2-function-param ((t (:foreground ,text))))
   `(js2-jsdoc-tag ((t (:foreground ,keywords))))
   `(js2-jsdoc-type ((t (:foreground ,constants))))
   `(js2-jsdoc-value((t (:foreground ,text))))
   `(js2-object-property ((t (:foreground ,text))))
   `(js2-external-variable ((t (:foreground ,constants))))
   `(js2-error ((t (:foreground ,error))))
   `(js2-warning ((t (:foreground ,warning))))

   ;; highlight numbers
   `(highlight-numbers-number ((t (:foreground ,numbers))))
  )

  (custom-theme-set-variables
    'luis
    '(linum-format " %5i ")
  )
)

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;; *****************************************************************************

(provide-theme 'luis)

;; Local Variables:
;; no-byte-compile: t
;; End:

(provide 'luis-theme)

;;; luis-theme.el ends here
