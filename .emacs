(add-to-list 'load-path "~/emacs/lisp/")

(add-to-list 'custom-theme-load-path "~/emacs/themes/")
;; (add-to-list 'custom-theme-load-path "~/emacs/themes/emacs-color-theme-solarized/")
;; (add-to-list 'custom-theme-load-path "~/emacs/themes/everforest/")
;; (add-to-list 'custom-theme-load-path "~/emacs/themes/gruvbox/")

;; (load-theme 'gruvbox-dark-hard t)
(load-theme 'deeper-blue t)

;;(setq find-program "~/emacs/find.exe")
(setq find-program (expand-file-name (concat (file-name-as-directory "~") "emacs/find.exe")))
(setq grep-find-template
      "find <D> <X> -type f -name '*.cpp' -exec grep <C> -nH -e <R> \\{\\} +")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;(use-package scroll-on-jump
 ;; :config
 ;;(setq scroll-on-jump-duration 0.6))

;; find-exe usuage
;; Usage: find [-H] [-L] [-P] [-Olevel] [-D debugopts] [path...] [expression]
;; 
;; Default path is the current directory; default expression is -print.
;; Expression may consist of: operators, options, tests, and actions.
;; 
;; Operators (decreasing precedence; -and is implicit where no others are given):
      ;; ( EXPR )   ! EXPR   -not EXPR   EXPR1 -a EXPR2   EXPR1 -and EXPR2
      ;; EXPR1 -o EXPR2   EXPR1 -or EXPR2   EXPR1 , EXPR2
;; 
;; Positional options (always true):
      ;; -daystart -follow -nowarn -regextype -warn
;; 
;; Normal options (always true, specified before other expressions):
      ;; -depth -files0-from FILE -maxdepth LEVELS -mindepth LEVELS
       ;; -mount -noleaf -xdev -ignore_readdir_race -noignore_readdir_race
;; 
;; Tests (N can be +N or -N or N):
      ;; -amin N -anewer FILE -atime N -cmin N -cnewer FILE -context CONTEXT
      ;; -ctime N -empty -false -fstype TYPE -gid N -group NAME -ilname PATTERN
      ;; -iname PATTERN -inum N -iwholename PATTERN -iregex PATTERN
      ;; -links N -lname PATTERN -mmin N -mtime N -name PATTERN -newer FILE
      ;; -nouser -nogroup -path PATTERN -perm [-/]MODE -regex PATTERN
      ;; -readable -writable -executable
      ;; -wholename PATTERN -size N[bcwkMG] -true -type [bcdpflsD] -uid N
      ;; -used N -user NAME -xtype [bcdpfls]
;; 
;; Actions:
      ;; -delete -print0 -printf FORMAT -fprintf FILE FORMAT -print
      ;; -fprint0 FILE -fprint FILE -ls -fls FILE -prune -quit
      ;; -exec COMMAND ; -exec COMMAND {} + -ok COMMAND ;
      ;; -execdir COMMAND ; -execdir COMMAND {} + -okdir COMMAND ;
;; 
;; Other common options:
      ;; --help                   display this help and exit
      ;; --version                output version information and exit
;; 
;; Valid arguments for -D:
;; exec, opt, rates, search, stat, time, tree, all, help
;; Use '-D help' for a description of the options, or see find(1)
;; 
;; Please see also the documentation at https://www.gnu.org/software/findutils/.
;; You can report (and track progress on fixing) bugs in the "find"
;; program via the GNU findutils bug-reporting page at
;; https://savannah.gnu.org/bugs/?group=findutils or, if
;; you have no web access, by sending email to <bug-findutils@gnu.org>.



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
(global-set-key (kbd "C-p")   'git-find-file)

(global-set-key (kbd "C-M-p") 'luis-set-project-directory)

(setq luis-project-directory (pwd))
(global-set-key (kbd "C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-;") 'other-window)

(global-set-key (kbd "C-z")     'undo)
(global-set-key (kbd "<M-f4>")  'kill-emacs)
(global-set-key (kbd "<f1>")    'goto-line)
(global-set-key (kbd "<f5>")    'make-without-asking)

(global-set-key (kbd "C-q") 'query-replace)
(global-set-key (kbd "M-q") 'query-replace)



(global-set-key (kbd "<C-prior>") 'previous-error)
(global-set-key (kbd "<C-next>")      'next-error)



(global-set-key (kbd "C-j") 'dabbrev-expand) ;; best emacs command by far
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
(global-set-key (kbd "<C-home>") 'move-beginning-of-line)
(global-set-key (kbd "<C-end>")  'move-end-of-line)



;; (global-set-key (kbd "<C-tab>")   'previous-buffer)   
;; (global-set-key (kbd "<C-S-tab>")     'next-buffer)

(global-set-key (kbd "<C-tab>") 'ido-switch-buffer)


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

(global-set-key (kbd "<C-down>")  'luis-transpose-line-down)
(global-set-key (kbd "<C-up>")    'luis-transpose-line-up)


(global-set-key (kbd "C-u")    'upcase-word)
(global-set-key (kbd "C-d")    'downcase-word)

;; (global-set-key (kbd "<M-up>")     (lambda () (interactive) (hs-hide-block) (previous-line)))
;; (global-set-key (kbd "<M-up>")     'hs-hide-block)
;; (global-set-key (kbd "<M-down>")   'hs-show-block)
;; (global-set-key (kbd "<M-C-down>") 'hs-show-all)

(global-set-key [(insert)]         'delete-horizontal-space)
(global-set-key [(control insert)] 'delete-blank-lines)

(global-set-key (kbd "<S-SPC>") 'exchange-point-and-mark)
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
   '("02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f"
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
 '(package-selected-packages '(doom-themes solarized-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
