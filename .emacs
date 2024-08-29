(add-to-list 'load-path "D:/emacs/lisp/")
(add-to-list 'custom-theme-load-path "D:/emacs/themes/")
(add-to-list 'custom-theme-load-path "D:/emacs/themes/emacs-color-theme-solarized/")
(add-to-list 'custom-theme-load-path "D:/emacs/themes/everforest/")
(add-to-list 'custom-theme-load-path "D:/emacs/themes/gruvbox/")

(load-theme 'luis t)

;;(setq find-program "~/emacs/find.exe")
(setq find-program (expand-file-name (concat (file-name-as-directory "~") "emacs/find.exe")))

;;(expand-file-name "~")

(setq kill-ring-max        8)
(setq mark-ring-max        3)
(setq global-mark-ring-max 3)
(setq-default set-mark-command-repeat-pop t)

(setq initial-major-mode 'text-mode) ;; by default it's lisp mode...

(defcustom luis-project-directory "~/"
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
(global-auto-revert-mode 1) ;; always reload from disk, don't ask

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
  (define-key ido-completion-map        (kbd "C-j") 'ido-next-match)
  (define-key ido-completion-map        (kbd "C-S-j") 'ido-prev-match)
  (define-key ido-completion-map        (kbd "M-j") 'ido-prev-match)
  (define-key ido-completion-map        [C-backspace]     'ido-delete-backward-updir)
  )

(add-hook 'ido-setup-hook #'bind-ido-keys)

;; this means dabbrev doesn't ignore case
(setq dabbrev-case-fold-search nil)

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "M-s") 'save-some-buffers)

(global-set-key (kbd "C-o") 'ido-find-file)
(global-set-key (kbd "M-o") 'ff-find-other-file)
(global-set-key (kbd "C-p") 'luis-project-find-relevant-file)
(global-set-key (kbd "M-p") 'luis-project-find-relevant-buffer)
(global-set-key (kbd "C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-;") 'other-window)

(global-set-key (kbd "C-z")     'undo)
(global-set-key (kbd "<M-f4>")  'kill-emacs)
(global-set-key (kbd "<f1>")    'goto-line)
(global-set-key (kbd "<f5>")    'make-without-asking)

(global-set-key (kbd "C-q") 'query-replace)
(global-set-key (kbd "M-q") 'query-replace)

(global-set-key (kbd "<C-home>") 'back-to-indentation-or-beginning)

(global-set-key (kbd "C-j") 'dabbrev-expand) ;; best emacs command by far
(global-set-key (kbd "C-,") '(lambda () (interactive)(insert "_")))
(global-set-key (kbd "C-.") '(lambda () (interactive)(insert "->")))
(global-set-key (kbd "C-a") 'comment-line)

(global-set-key [C-backspace]   '*backspace-word) ;;sub words
(global-set-key [C-delete]      '*delete-word)

(global-set-key (kbd "<home>")   'luis-back-to-indentation-or-beginning)
;; (global-set-key (kbd "<S-home>") 'luis-back-to-indentation-or-beginning-selection) ;; not sure why this doesn't work
(global-set-key (kbd "<C-home>") 'luis-back-to-indentation-or-beginning)   
(global-set-key (kbd "<C-end>")  'move-end-of-line)


(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-r") 'isearch-backward)
(global-set-key (kbd "M-f") 'isearch-forward-regexp)
(global-set-key (kbd "M-r") 'isearch-backward-regexp)

(global-set-key (kbd "M-i") 'luis-open-braces)
(global-set-key (kbd "M-k") 'luis-delete-line) ;; used to be kill-sentence

(global-set-key (kbd "C-\\") 'luis-select-surrounding-scope)

(global-set-key (kbd "M-p") 'scroll-down-command)
(global-set-key (kbd "M-n") 'scroll-up-command)

(global-set-key (kbd "C-0")  'delete-window)
(global-set-key (kbd "C-1")  'delete-other-windows)

(global-set-key (kbd "C-2") (lambda () (interactive)(split-window-below) (other-window 1)))
(global-set-key (kbd "C-3") (lambda () (interactive)(split-window-right) (other-window 1)))

(global-set-key (kbd "<C-down>")  'luis-transpose-line-down)
(global-set-key (kbd "<C-up>")    'luis-transpose-line-up)

(global-set-key [(insert)]         'c-hungry-delete-forward)
(global-set-key [(control insert)] 'c-hungry-delete-backwards)

(global-set-key (kbd "<S-SPC>") 'exchange-point-and-mark)
(global-set-key (kbd "C-e") 'luis-copy-region-or-line) ;; copy

(global-set-key (kbd "C-v") 'yank)           ;;paste
(global-set-key (kbd "M-v") 'yank-pop)       ;;cycle through kill ring


;;isearch stuff
(define-key isearch-mode-map (kbd "<C-return>")   'isearch-exit-leave-selection)
;;(define-key isearch-mode-map (kbd "<C-backspace>") 'isearch-clear-string)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(define-key isearch-mode-map "\C-r" 'isearch-repeat-backward)
;; (define-key isearch-mode-map (kbd "C-,") '*isearch-underscore)
;; (define-key isearch-mode-map (kbd "C-.") '*isearch-pointer-arrow)
(define-key isearch-mode-map (kbd "<up>")   'isearch-ring-retreat)
(define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance)
(define-key isearch-mode-map (kbd "<C-v>")  'isearch-yank-kill)

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


;; VS 2019
;; C:\...\my.cpp(26,21): error C2544: ... [c:\...\.vcxproj]
;; taken from Jobbflykt from his wordpress site
;; NOTE on newer versions of compiler may also say 'fatal error' instead of just error...


;; (add-to-list
;;  'compilation-error-regexp-alist
;;   (list (concat
;;         "^"
;;         "\\([^(]+\\)"                                ; 1
;;         "(\\([0-9]+\\)\\(?:,\\([0-9]+\\)\\)?) ?: "   ; 2,(3)
;;         "\\(\\(?:error\\|\\(warning\\)\\) [^ :]+\\)" ; 4,(5)
;;         )
;;        1                          ;FILE
;;        2                          ;LINE
;;        3                          ;COLUMN
;;        '(5)                       ;ERROR is warning if 5 matched, else error.
;;        nil                        ;HYPERLINK
;;        '(4 font-lock-comment-face)
;;        ) )

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


(defun my-cc-mode-common-hook ()
  "Setup common utilities for all C-like modes."

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


(defun *delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))

(defun *backspace-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (*delete-word (- arg)))
