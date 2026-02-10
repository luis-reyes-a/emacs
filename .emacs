(add-to-list 'load-path "~/emacs/lisp/")
(add-to-list 'load-path "~/emacs/lisp/consult/")
(add-to-list 'custom-theme-load-path "~/emacs/themes/")


;; Avoid GC pauses during interaction
(setq gc-cons-threshold 100000000) ;; 100 MB

;; Don't resize windows frequently
(setq frame-inhibit-implied-resize t)

;; Faster redisplay
(setq redisplay-dont-pause t)

;; Make scrolling smoother
(setq fast-but-imprecise-scrolling t)

;; (load-theme 'gruvbox-dark-hard t)
;; (load-theme 'deeper-blue t)
;; (set-cursor-color "tan2")
(load-theme 'doom-monokai-classic t)

;; (load-theme 'greener-blue t)

;;(setq find-program "~/emacs/find.exe")
;; (setq find-program (expand-file-name (concat (file-name-as-directory "~") "emacs/find.exe")))
;; (setq grep-find-template
      ;; "find <D> <X> -type f -name '*.cpp' -exec grep <C> -nH -e <R> \\{\\} +")

(setq project-find-regexp 'ripgrep)

(require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(require 'vertico)
(setq vertico-cycle t)
(vertico-mode 1)

(require 'marginalia)
(marginalia-mode 1)


(require 'consult)
(setq consult-find-command "D:/Git/usr/bin/find.exe")
;; (setq consult-find-args '("%d" "-type" "f" "-iname" "%s"))

(require 'orderless)

(setq completion-styles '(orderless basic))
(setq completion-category-defaults nil)
(setq completion-category-overrides
      '((file (styles orderless))
        (command (styles orderless))))

(setq orderless-matching-styles '(orderless-literal))




(setq kill-ring-max        16)
(setq mark-ring-max        8)
(setq global-mark-ring-max 8)
(setq-default set-mark-command-repeat-pop t)

(setq scroll-step 10)
(setq line-spacing 4)

(setq initial-major-mode 'text-mode) ;; by default it's lisp mode...

(defcustom luis-project-directory "~"
  "Non-nil means automatically frobnicate all buffers."
  :type 'string)

(setq luis-project-directory (pwd))

(when (member "Consolas" (font-family-list)) (set-face-attribute 'default nil :font "Consolas")) ; use Consolas if available
(set-face-attribute 'default nil :height 185)

(superword-mode nil)

(scroll-bar-mode 0)
(setq scroll-preserve-screen-position t)
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ; maximize on start
(show-paren-mode t)
(set-frame-parameter nil 'background-mode 'dark)

(global-auto-revert-mode t)  ;; always reload from disk, don't ask

(setq completions-format 'vertical)
(setq-default line-spacing 2)

(setq mouse-wheel-progressive-speed nil)

;we add this bc otherwise reloading this file within emacs keeps splitting the window right
(delete-other-windows)

(tool-bar-mode -1)
(menu-bar-mode -1)
;;(blink-cursor-mode 0)
(setq blink-cursor-blinks 0)
(setq ring-bell-function 'ignore)

(setq make-backup-files nil) 
(setq create-lockfiles nil)

;; use spaces instead of tabs when reindenting text
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(add-hook 'prog-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))


(ido-mode t)
(defun bind-ido-keys ()
  "Keybindings for ido mode."
  (define-key ido-completion-map        [C-backspace]     'ido-delete-backward-updir)

  (define-key ido-completion-map        (kbd "<C-return>") 'ido-select-text)
  (define-key ido-completion-map        (kbd "<tab>")      'ido-complete)
  (define-key ido-completion-map        (kbd "<C-tab>")    'ido-next-match)
  (define-key ido-completion-map        (kbd "<S-tab>")    'ido-prev-match)
  )

(add-hook 'ido-setup-hook #'bind-ido-keys)

;; this means dabbrev doesn't ignore case
(setq dabbrev-case-fold-search nil)

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "M-s") 'save-some-buffers)

(global-set-key (kbd "C-o")   'ido-find-file)
(global-set-key (kbd "M-o")   'ff-find-other-file)
;; (global-set-key (kbd "C-p")   'luis-project-find-relevant-file)
;; (global-set-key (kbd "M-p")   'luis-project-find-relevant-buffer)
;;(global-set-key (kbd "C-p")   'git-find-file)
(global-set-key (kbd "C-p")   'project-find-file)
(global-set-key (kbd "M-p")   'consult-ripgrep)
(global-set-key (kbd "C-M-p") 'consult-fd)

(global-set-key (kbd "C-`")   'consult-ripgrep)



(global-set-key (kbd "C-M-p") 'luis-set-project-directory)

;; (setq luis-project-directory (pwd))
;; (global-set-key (kbd "C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-b") 'consult-buffer)
(global-set-key (kbd "M-b") 'consult-buffer-other-window)

(global-set-key (kbd "C-;") 'other-window)
(global-set-key (kbd "M-;") 'luis-view-buffer-in-other-window-or-split)

(global-set-key (kbd "C-z")     'undo)
(global-set-key (kbd "<M-f4>")  'kill-emacs)
(global-set-key (kbd "<f1>")    'consult-goto-line)

;; <f3> defaults to begin defining macro
;; <f4> defaults to end defining macro and execute


(global-set-key (kbd "<f5>")    'make-without-asking)

(global-set-key (kbd "C-q") 'query-replace)
(global-set-key (kbd "M-q") 'query-replace)



(global-set-key (kbd "<C-prior>") 'previous-error)
(global-set-key (kbd "<C-next>")      'next-error)



(global-set-key (kbd "C-j") 'dabbrev-expand)     ;; best emacs command by far
(global-set-key (kbd "M-j") 'dabbrev-completion) 

(global-set-key (kbd "C-,") '(lambda () (interactive)(insert "_")))
(global-set-key (kbd "C-.") '(lambda () (interactive)(insert "->")))
(global-set-key (kbd "C-a") 'comment-line)

;; this doesn't put word in kill ring... I never want that!
(global-set-key [C-backspace]   'my-backspace-word) 
(global-set-key [C-delete]      'my-delete-word)

(global-set-key [S-backspace]   'my-backspace-subword) 
(global-set-key [S-delete]      'my-delete-subword)


(global-set-key [M-backspace]   'c-hungry-delete-backwards) 
(global-set-key [M-delete]      'c-hungry-delete-forward)


;;(global-set-key (kbd "<home>")   'luis-back-to-indentation-or-beginning)
(global-set-key (kbd "<home>")  'back-to-indentation)
;; (global-set-key (kbd "<S-home>") 'luis-back-to-indentation-or-beginning-selection) ;; not sure why this doesn't work


;; (global-set-key (kbd "<C-home>") 'hs-show-all)
;; (global-set-key (kbd "<C-end>")  'luis-toggle-code-fold)

(global-set-key (kbd "<C-home>") 'delete-horizontal-space)
(global-set-key (kbd "<C-end>")  'align-to-mark)



;; (global-set-key (kbd "<C-tab>")   'previous-buffer)   
;; (global-set-key (kbd "<C-S-tab>")     'next-buffer)

(global-set-key (kbd "<C-tab>") 'consult-buffer)

(global-set-key (kbd "C-n")  'consult-line)
(global-set-key (kbd "M-n")  'consult-line-multi)

(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-r") 'isearch-backward)
(global-set-key (kbd "M-f") 'isearch-forward-regexp)
(global-set-key (kbd "M-r") 'isearch-backward-regexp)



(global-set-key (kbd "M-i") 'luis-open-braces)
(global-set-key (kbd "M-k") 'luis-delete-line) ;; used to be kill-sentence
(global-set-key (kbd "M-l") 'luis-duplicate-line)

(global-set-key (kbd "C-S-k") 'luis-kill-start-of-line)




(global-set-key (kbd "C-\\") 'luis-select-surrounding-scope)
(global-set-key (kbd "M-\\") 'backward-up-list)

(global-set-key (kbd "C-0")  'delete-window)
(global-set-key (kbd "C-1")  'delete-other-windows)

(global-set-key (kbd "C-2") (lambda () (interactive)(split-window-below) (other-window 1)))
(global-set-key (kbd "C-3") (lambda () (interactive)(split-window-right) (other-window 1)))

;; I always hit these by mistake
(global-set-key (kbd "C-4")  'ignore)
(global-set-key (kbd "C-5")  'ignore)
(global-set-key (kbd "C-6")  'ignore)
(global-set-key (kbd "C-7")  'ignore)
(global-set-key (kbd "C-8")  'ignore)
(global-set-key (kbd "C-9")  'ignore)



;; (global-set-key (kbd "M-u")    'universal-argument)
;; (global-set-key (kbd "C-u")    'upcase-word)
(global-set-key (kbd "C-d")    'downcase-word)
(global-set-key (kbd "M-d")    'upcase-word)
;; (global-set-key (kbd "<M-up>")     (lambda () (interactive) (hs-hide-block) (previous-line)))
;; (global-set-key (kbd "<M-up>")     'hs-hide-block)
;; (global-set-key (kbd "<M-down>")   'hs-show-block)
;; (global-set-key (kbd "<M-C-down>") 'hs-show-all)

(global-set-key (kbd "<C-down>")  'forward-paragraph)
(global-set-key (kbd "<C-up>")    'backward-paragraph)

(global-set-key (kbd "M-{")  'backward-sexp)
(global-set-key (kbd "M-}")  'forward-sexp)
(global-set-key (kbd "M-[")  'luis-transpose-line-up)
(global-set-key (kbd "M-]")  'luis-transpose-line-down)

(global-set-key (kbd "<M-up>")     'scroll-up-line)
(global-set-key (kbd "<M-down>")   'scroll-down-line)
(global-set-key (kbd "<M-left>")   'consult-global-mark)
(global-set-key (kbd "<M-right>")  'consult-mark)


;; list pastes and pick to insert. If had just pasted, it will replace it.
(global-set-key (kbd "C-M-y")  'consult-yank-replace)


 

(global-set-key [(control insert)] 'delete-blank-lines)
(global-set-key [(insert)]         'delete-horizontal-space)

;; (global-set-key (kbd "<S-SPC>") 'exchange-point-and-mark)

(global-set-key (kbd "<SPC>")   'luis-press-space)
(global-set-key (kbd "<M-SPC>") 'exchange-point-and-mark)
(global-set-key (kbd "C-e") 'luis-copy-region-or-line) ;; copy

(global-set-key (kbd "C-v") 'yank)           ;;paste
(global-set-key (kbd "M-v") 'yank-pop)       ;;cycle through kill ring


;;isearch stuff
(define-key isearch-mode-map (kbd "<C-return>")   'isearch-cancel)
(define-key isearch-mode-map (kbd "<ESC>")   'isearch-cancel)
;;(define-key isearch-mode-map (kbd "<C-backspace>") 'isearch-clear-string)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(define-key isearch-mode-map "\C-r" 'isearch-repeat-backward)
;; (define-key isearch-mode-map (kbd "C-,") '*isearch-underscore)
;; (define-key isearch-mode-map (kbd "C-.") '*isearch-pointer-arrow)
(define-key isearch-mode-map (kbd "<up>")   'isearch-ring-retreat)
(define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance)
(define-key isearch-mode-map (kbd "<C-v>")  'isearch-yank-kill)


(defalias 'rect-string 'string-rectangle)
(defalias 'rect-kill   'kill-rectangle)
(defalias 'rect-copy   'copy-rectangle-as-kill)
(defalias 'rect-delete 'delete-rectangle)
(defalias 'rect-paste  'yank-rectangle)
(defalias 'rect-clear  'clear-rectangle)
(defalias 'rect-prefix-space   'open-rectangle) ;; adds leading space to rect
(defalias 'rect-prefix-numbers 'rectangle-number-lines)
(defalias 'rect-prefix-string  'string-insert-rectangle)
(defalias 'rect-remove-leading-whitespace 'delete-whitespace-rectangle)


(require 'project)
(require 'xref)
(require 's)
(require 'dash)
(require 'popup)
(require 'dumb-jump)


(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)



(defun proj-regex (pattern extensions)
  "Search for PATTERN in the current project in files with specified EXTENSIONS.
EXTENSIONS should be a comma-separated list like cpp,h,c,glsl,txt.
Results go to the *grep* buffer."
  (interactive
   (let ((pattern (read-string "Pattern: "))
         (exts (read-string "File extensions (comma-separated, default cpp,h,c,glsl,txt): "
                            "cpp,h,c,glsl,txt")))
     (list pattern exts)))
  (let* ((proj (project-current t))
         (root (car (project-roots proj)))
         (default-directory root)
         (ext-list (split-string extensions "," t))
         ;; filter project files by extensions
         (files (seq-filter
                 (lambda (f)
                   (seq-some (lambda (ext)
                               (string-suffix-p (concat "." ext) f t))
                             ext-list))
                 (project-files proj)))
         (files-str (mapconcat #'shell-quote-argument files " "))
         (cmd (format "rg --no-heading --line-number --color never --no-config --no-ignore --text %s %s"
                      (shell-quote-argument pattern)
                      files-str)))
    ;; run grep; initial command will be visible
    (grep cmd)))

(defun proj-find (pattern extensions)
  "Search for PATTERN literally (not as regex) in project files with specified EXTENSIONS.
EXTENSIONS should be a comma-separated list like cpp,h,c,glsl,txt.
Results go to the *grep* buffer."
  (interactive
   (let ((pattern (read-string "Text to search (literal match): "))
         (exts (read-string "File extensions (comma-separated, default cpp,h,c,glsl,txt): "
                            "cpp,h,c,glsl,txt")))
     (list pattern exts)))
  (let* ((proj (project-current t))
         (root (car (project-roots proj)))
         (default-directory root)
         (ext-list (split-string extensions "," t))
         ;; filter project files by extensions
         (files (seq-filter
                 (lambda (f)
                   (seq-some (lambda (ext)
                               (string-suffix-p (concat "." ext) f t))
                             ext-list))
                 (project-files proj)))
         (files-str (mapconcat #'shell-quote-argument files " "))
         ;; add -F for literal match
         (cmd (format "rg -F --no-heading --line-number --color never --no-config --no-ignore --text %s %s"
                      (shell-quote-argument pattern)
                      files-str)))
    ;; run grep; command visible in *grep* buffer
    (grep cmd)))

;; there's prob a better way of doing this, but this is best chatgpt can make 


(defun my/subword->name-regex (raw)
  "Convert RAW input into a function-name regex.
Leading space disables prefix expansion.
Trailing space disables suffix expansion."
  (let* ((no-prefix (string-prefix-p " " raw))
         (no-suffix (string-suffix-p " " raw))
         (core (string-trim raw)))
    (concat
     (unless no-prefix "\\w*")
     (regexp-quote core)
     (unless no-suffix "\\w*"))))

;;;; ----------------------------------------
;;;; Main search command
;;;; ----------------------------------------

(defun proj-function ()
  "Find C/C++-style function declarations or definitions in the project."
  (interactive)
  (let* ((proj (project-current t))
         (roots (project-roots proj))
         (root (car roots))

         ;; prompts
         (raw-name (read-string "Function name (spaces anchor subword): "))
         (exts (split-string
                (read-string "File extensions (space-separated): "
                             "cpp h c glsl")
                " +" t))
         (kind (read-char-choice
                "Kind [d=definition, e=declaration, b=both]: "
                '(?d ?e ?b)))

         ;; name regex
         (name-re (my/subword->name-regex raw-name))

         ;; ending selector
         (ending
          (pcase kind
            (?d "{")
            (?e ";")
            (?b "[{;]")))

         ;; file globs
         (globs
          (mapconcat
           (lambda (e) (format "--include=*.%s" e))
           exts
           " "))

         ;; full regex
         (regex
          (format
           "^[[:space:]]*[a-zA-Z_][a-zA-Z0-9_:<>*& ]+[[:space:]]+([a-zA-Z_][a-zA-Z0-9_:]*::)?%s[[:space:]]*\\([^;]*\\)[[:space:]]*%s"
           name-re
           ending))

         ;; grep command
         (cmd
          (format
           "grep -R -n -E %s -e \"%s\" \"%s\""
           globs
           regex
           root)))

    ;; run grep
    (grep cmd)))




(add-hook 'compilation-mode-hook
  (lambda ()
    (define-key compilation-mode-map (kbd "C-o")   'ido-find-file)
    ))

(setq mylist (list "red" "blue" "yellow" "clear" "i-dont-know"))

(defun favorite-color ()
  (interactive)
  (ido-completing-read "What, ... is your favorite color? " mylist)
  )

(defun print-project-files ()
  (interactive)
  ;;(print (directory-files-recursively luis-project-directory "*.") (current-buffer))
  (print (directory-files-recursively luis-project-directory ".*\\.\\(cpp\\|h\\|c\\|hpp\\|txt\\)") (current-buffer))
  )

(defun luis-view-buffer-in-other-window-or-split ()
  "View the current buffer in the other window. If no other window, split and show it."
  (interactive)
  (let ((buf (current-buffer)))
    (if (one-window-p)
        (split-window-right)) ;; or split-window-below
    (other-window 1)
    (switch-to-buffer buf)))
                   
(defun luis-duplicate-line()
  (interactive)
  (let ((init_col (current-column)))

    (move-beginning-of-line 1)
    (kill-line)
    (yank)
    (open-line 1)
    (next-line 1)
    (yank)
    (move-to-column init_col)))

(defun luis-press-space()
  "Swap point and mark if transient-mark-mode is active and region is active. Otherwise insert space."
  (interactive)
  (if (and transient-mark-mode (region-active-p))
      (exchange-point-and-mark)
    (insert " ")))

(defun luis-back-to-indentation-or-beginning () (interactive)
       (if (= (point) (progn (back-to-indentation) (point)))
           (beginning-of-line)))

(defun luis-back-to-indentation-or-beginning-selection () (interactive)
       ;; set mark if not set already
       (when (not (use-region-p)) 
         (set-mark-command (point)))
       (if (= (point) (progn (back-to-indentation) (point)))
           (beginning-of-line)))

(defun luis-transpose-line-up ()
  (interactive)
  (next-line)
  (transpose-lines -1)
  (previous-line)
  )

(defun luis-transpose-line-down ()
  (interactive)
  (next-line)
  (transpose-lines 1)
  (previous-line)
  )

(defun luis-delete-line ()
  "Delete text from current position to end of line char.
This command does not push text to `kill-ring'."
  (interactive)
  (beginning-of-line 1)
  (delete-region
   (point)
   (progn (end-of-line 1) (point)))
  (delete-char 1))

(defun luis-kill-start-of-line ()
  "Delete text from current position to end of line char.
This command does not push text to `kill-ring'."
  (interactive)
  (kill-region
   (point)
   (progn (beginning-of-line 1) (point))))

(defun luis-select-surrounding-scope ()
  (interactive)
  (backward-up-list) 
  (mark-sexp))

;; TODO is there a way to do this recursively always?...
(defun luis-project-find-relevant-file ()
  (interactive)
  (let* ((paths (mapcar (lambda (x) (file-relative-name x luis-project-directory)) (directory-files-recursively luis-project-directory ".*\\.\\(cpp\\|h\\|c\\|hpp\\|txt\\)$" )))
      (result (ido-completing-read "Open: " paths))
      (path (concat luis-project-directory "/" result)))
      (find-file path)   
      ))

(defun luis-project-find-relevant-buffer ()
  (interactive)
  (let* ((paths (seq-filter (lambda (x) (get-file-buffer x)) (directory-files-recursively luis-project-directory ".*\\.\\(cpp\\|h\\|c\\|hpp\\|txt\\)$" )))
      (relative_paths (mapcar (lambda (x) (file-relative-name x luis-project-directory)) paths))
      (result (ido-completing-read "Open: " relative_paths))
      (path (concat luis-project-directory "/" result))
      ;;(buf (get-file-buffer path))
      )
      ;; (switch-to-buffer buf)
      (find-file path)
      
      ))

(defun luis-toggle-code-fold () (interactive)
       (if (eq ?{ (preceding-char))
           (left-char))
       (hs-toggle-hiding)
       )


(defun luis-set-project-directory () (interactive)
       (setq luis-project-directory (read-from-minibuffer (concat "Change Project Directory from " luis-project-directory " to: ")))
       (message "Project Directory is now %s" luis-project-directory)
       )




;; this fucking crap doesn't work,
;; (defun luis-find-in-files (&optional dir allowed-exts)
  ;; (interactive)
  ;; (if (not dir)
      ;; (setq dir "."))

  ;; (if (not allowed-exts)
      ;; (setq allowed-exts '("h" "cpp" "c" "txt" "hpp")))

  ;; (let*
     ;; (
      ;; (file-ext-string (mapconcat (lambda (x)
          ;; (concat " -name '*." x "'")) allowed-exts " -o ")
              ;; )
      
      ;; )

     ;; (shell-command (concat find-program " " dir " -type f" file-ext-string " -exec grep -nH --null -f struct {} ;") (get-buffer "*grep*")))
  ;; )
      



(defun align-to-mark ()
  "Insert spaces to reach the column of the mark."
  (interactive)
  (let ((target-col (save-excursion
                      (goto-char (mark))
                      (current-column)))
        (current-col (current-column)))
    (when (< current-col target-col)
      (insert (make-string (- target-col current-col) ?\s)))))


(defun luis-open-braces ()
  "Move to { and open brace pair"
  (interactive)
  (search-backward (char-to-string ?{))
  (right-char)
  (push-mark)
  (insert "\n\n")
  (search-forward (char-to-string ?}))
  (right-char)
  (indent-region (mark) (point))
  (pop-mark)
  (previous-line)
  (indent-for-tab-command))

(require 'cc-mode)
(setq c-default-style "linux" c-basic-offset 4)
(c-set-offset (quote cpp-macro) 0 nil)
(c-set-offset (quote substatement) 0)
(c-set-offset (quote substatement-open) 0)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(font-lock-add-keywords 'c++-mode '(("defer" . font-lock-keyword-face)))

;;NOTE this was taken from Handmade Hero, thank you Casey!
(require 'compile)
(setq compilation-ask-about-save nil) ; don't ask to save every file when compiling
(setq compilation-directory-locked nil)
(setq compilation-context-lines 0)
(setq compilation-error-regexp-alist
      (cons '("^\\([0-9]+>\\)?\\(\\(?:[a-zA-Z]:\\)?[^:(\t\n]+\\)(\\([0-9]+\\)) : \\(?:fatal \\)?\\(?:error\\|warnin\\(g\\)\\) C[0-9]+:" 2 3 nil (4))
            compilation-error-regexp-alist))

(defun luis-copy-region-or-line()
  (interactive)
  (if (use-region-p)
      (kill-ring-save (region-beginning) (region-end))
    (progn
      (back-to-indentation)
      (set-mark-command nil)
      (end-of-line)
      (kill-ring-save (region-beginning) (region-end))
      (message "Copied line"))
    ))


(defun rgc-find-git-root ()
  "Find git root directory from current directory."
  (interactive)
  (rgc-member-directory default-directory
                        "~/"
                        (lambda (x)
                          (file-exists-p (concat x ".git")))))

(defun rgc-member-directory (from to fun &optional if-nil)
  "Returns a directory between `from' and `to' for wich `fun'
returns non nil. The search begins on the child 'from' and goes
up till 'to', or '/'. If `if-nil' is provided, in case of not
finding any suitable directory, it returns it instead of `to'"
  (when (not (file-exists-p from))
    (return))
  (if (or (equal (expand-file-name from) (expand-file-name to))
          (equal from "/")) ;how to do it multiplatform?
      (or if-nil to)
    (if (funcall fun from) from
      (rgc-member-directory (expand-file-name (concat from "/../")) ;how to do it multiplatform?
                            to
                            fun
                            if-nil))))

(defun git-find-file ()
  (interactive)
  (let* ((git-root (rgc-find-git-root))
         (ido-enable-regexp nil)
         (repo-files (split-string
                      (with-temp-buffer
                        (cd git-root)
                        (shell-command "git ls-files" t)
                        (buffer-string)))))
    (find-file (concat git-root "/"
                (ido-completing-read "file: " repo-files t t)))))
(global-set-key (kbd "C-x f") 'find-file-in-repo)


;; VS 2019
;; C:\...\my.cpp(26,21): error C2544: ... [c:\...\.vcxproj]
;; taken from Jobbflykt from his wordpress site
;; NOTE on newer versions of compiler may also say 'fatal error' instead of just error...


(add-to-list
 'compilation-error-regexp-alist
  (list (concat
        "^"
        "\\([^(]+\\)"                                ; 1
        "(\\([0-9]+\\)\\(?:,\\([0-9]+\\)\\)?) ?: "   ; 2,(3)
        "\\(\\(?:error\\|\\(warning\\)\\) [^ :]+\\)" ; 4,(5)
        )
       1                          ;FILE
       2                          ;LINE
       3                          ;COLUMN
       '(5)                       ;ERROR is warning if 5 matched, else error.
       nil                        ;HYPERLINK
       '(4 font-lock-comment-face)
       ) )

(defun find-project-directory-recursive ()
  "Recursively search for a makefile."
  (interactive)
  (if (file-exists-p "build.bat") t
    (cd "../")
    (find-project-directory-recursive)))

(defun lock-compilation-directory ()
  "The compilation process should NOT hunt for a makefile"
  (interactive)
  (setq compilation-directory-locked t)
  (message "Compilation directory is locked."))

(defun unlock-compilation-directory ()
  "The compilation process SHOULD hunt for a makefile"
  (interactive)
  (setq compilation-directory-locked nil)
  (message "Compilation directory is roaming."))

(defun find-project-directory ()
  "Find the project directory."
  (interactive)
  (setq find-project-from-directory default-directory)
  (switch-to-buffer-other-window "*compilation*")
  (if compilation-directory-locked (cd last-compilation-directory)
    (cd find-project-from-directory)
    (find-project-directory-recursive)
    (setq last-compilation-directory default-directory)))

(defun make-without-asking ()
  "Make the current build."
  (interactive)
  (tab-bar-select-tab 1) ; go to the first tab
  (if (find-project-directory) (compile "build.bat"))
  (other-window 1))


(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'superword-mode)


(defun my-cc-mode-common-hook ()
  "Setup common utilities for all C-like modes."
  ;; (superword-mode)

  ;; (adaptive-wrap-prefix-mode)
  ;; (which-function-mode)
  
  ;; (font-lock-add-keywords
  ;;  nil
  ;;  '((printf-fmt-matcher (0 'font-lock-format-specifier-face prepend))))

  ;; (font-lock-add-keywords
  ;;  nil
  ;;  '(("[<>{}():&*=+^%!~,.?;/-]" (0 'font-lock-operator-face prepend))))

  (defun insert-header-text ()
    "Format the given file as a header file."
    (interactive)
    (setq base_file_name (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
    (insert "#ifndef ")
    (push-mark)
    (insert base_file_name)
    (upcase-region (mark) (point))
    (pop-mark)
    (insert "_H\n")
    
    (insert "#define ")
    (push-mark)
    (insert base_file_name)
    (upcase-region (mark) (point))
    (pop-mark)
    (insert "_H\n\n")
    
    (insert "#endif // ")
    (push-mark)
    (insert base_file_name)
    (upcase-region (mark) (point))
    (pop-mark)
    (insert "_H")
    
    (previous-line)
    )

  (cond ((file-exists-p buffer-file-name) t)
        ((string-match "[.]h" buffer-file-name) (insert-header-text))
        ((string-match "[.]hpp" buffer-file-name) (insert-header-text)))
)

(add-hook 'c-mode-common-hook #'my-cc-mode-common-hook)


(defun my-delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))

(defun my-backspace-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (my-delete-word (- arg)))

(defun my-delete-subword (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (setq superword-mode nil)
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point)))
  (setq superword-mode t))

(defun my-backspace-subword (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (my-delete-subword (- arg)))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7964b513f8a2bb14803e717e0ac0123f100fb92160dcf4a467f530868ebaae3e"
     "c8c4baac2988652a760554e0e7ce11a0fe0f8468736be2b79355c9d9cc14b751"
     "10e5d4cc0f67ed5cafac0f4252093d2119ee8b8cb449e7053273453c1a1eb7cc"
     "2b20b4633721cc23869499012a69894293d49e147feeb833663fdc968f240873"
     "c372798bb70eb1bb0e1853426af19ba7bb0adeebace94c83b2d4f5f87c6ea528"
     "691d671429fa6c6d73098fc6ff05d4a14a323ea0a18787daeb93fde0e48ab18b"
     "e14e3f922d0d49897af4c5aec09349d3a9a9d62d9a02982ed6eb8a1278f0b531"
     "4eccaacd218dfdc3d8832f44498bb8891430259c8dfb824c548e62aff1aff41b"
     "0d6f7e092bdc03f7af8a1c98beb465659e0818a7c6b0293188940c36ac422e1c"
     "b16a32932d6af9a2132489733b8a059f41e9fffe23ccae5486c16dccadb82611"
     "32efa5aa1c5896a9906ea49c27cfabf3a6b51f804f131b1457c09a78108eac93"
     "7b45fd65347832b596cd5691c07ac381179c38c351886f7fff6e1df6eef789f9"
     "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290"
     "e8bd9bbf6506afca133125b0be48b1f033b1c8647c628652ab7a2fe065c10ef0"
     "48042425e84cd92184837e01d0b4fe9f912d875c43021c3bcb7eeb51f1be5710"
     "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f"
     "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350"
     "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725"
     "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700"
     "a6920ee8b55c441ada9a19a44e9048be3bfb1338d06fc41bce3819ac22e4b5a1"
     "7c28419e963b04bf7ad14f3d8f6655c078de75e4944843ef9522dbecfcd8717d"
     "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69"
     "ffafb0e9f63935183713b204c11d22225008559fa62133a69848835f4f4a758c"
     "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5"
     "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773"
     "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e"
     "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c"
     "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3"
     "39f0ac86b012062fed46469cc5ea1b00aa534db587ad21d55a9717a1bac99a27"
     "98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd"
     "ba323a013c25b355eb9a0550541573d535831c557674c8d59b9ac6aa720c21d3"
     "a5270d86fac30303c5910be7403467662d7601b821af2ff0c4eb181153ebfc0a"
     "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d"
     "7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98"
     default))
 '(package-selected-packages '(consult doom-themes marginalia solarized-theme vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "light slate gray" :slant normal))))
 '(font-lock-type-face ((t (:foreground "#66D9EF" :slant normal))))
 '(mode-line-buffer-id ((t (:foreground "tan2" :weight bold)))))
