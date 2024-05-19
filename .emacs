(add-to-list 'load-path "D:/emacs/lisp/")
(add-to-list 'custom-theme-load-path "D:/emacs/themes/")
(add-to-list 'custom-theme-load-path "D:/emacs/themes/emacs-color-theme-solarized/")
(add-to-list 'custom-theme-load-path "D:/emacs/themes/everforest/")
(add-to-list 'custom-theme-load-path "D:/emacs/themes/gruvbox/")

(setq kill-ring-max        8)
(setq mark-ring-max        3)
(setq global-mark-ring-max 3)
(setq-default set-mark-command-repeat-pop t)

(setq initial-major-mode 'text-mode) ;; make *scratch* default to text?

(when (member "Consolas" (font-family-list)) (set-face-attribute 'default nil :font "Consolas")) ; use Consolas if available
(set-face-attribute 'default nil :height 185)

(scroll-bar-mode 0)
(setq scroll-preserve-screen-position t)
;;(tab-bar-mode 1)
;; (visual-line-mode t)
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ; maximize on start
(show-paren-mode t)
(set-frame-parameter nil 'background-mode 'dark)
;;(load-theme 'solarized t)
;;(load-theme 'zenburn t)
;;(load-theme 'vscode-dark-plus t)
;;(load-theme 'classic t)
;;(load-theme 'everforest-hard-dark t)

;;(load-theme 'misterioso t)
;;(set-cursor-color "white") ;; misterioso default cursor looks weird...

(setq completions-format 'vertical)


(setq-default line-spacing 2)

(require 'adaptive-wrap)
;;(setq adaptive-wrap-extra-indent 2)
;;(adaptive-wrap-prefix-mode)



(require 'dumb-jump)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; (global-hl-line-mode +1)
;; (hl-line-mode)
;; (set-face-background 'hl-line "#363636") ;"#2b2b2b" (v dark grey) "#323e42" (dark grey-blue)
;; (set-face-foreground 'highlight nil) 

(setq mouse-wheel-progressive-speed nil)

;;(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
;;(add-to-list 'default-frame-alist '(alpha . (85 . 50)))

(delete-other-windows) ;we add this bc otherwise reloading this file within emacs keeps splitting the window right
;;(split-window-right)
(tool-bar-mode -1)
(menu-bar-mode -1)
;;(blink-cursor-mode 0)
(setq blink-cursor-blinks 0)
(setq ring-bell-function 'ignore)
;; (menu-bar-mode -1)
;; (superword-mode t)





(setq make-backup-files nil) 
(setq create-lockfiles nil)
(global-auto-revert-mode t) ;always reload from disk, don't ask me 

;; (require 'rainbow-delimiters)
;; (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; couldn't get this to work...
;; (setq everything-ffap-integration nil)
;; (setq everything-cmd "D:/Everything-1.4.1.1022.x64/es.exe") 
;; (require 'everything)

(setq-default indent-tabs-mode nil)


(ido-mode t)
(defun bind-ido-keys ()
  "Keybindings for ido mode."
  (define-key ido-completion-map        (kbd "C-j") 'ido-next-match)
  (define-key ido-completion-map        (kbd "M-j") 'ido-prev-match)
  (define-key ido-completion-map        [C-backspace]     'ido-delete-backward-updir)
  )

(add-hook 'ido-setup-hook #'bind-ido-keys)

;; (defun my-ido-make-buffer-list-hook ()
;;     (setq ido-temp-list (mapcar 'car (window-prev-buffers (selected-window)))))
    
;; (add-hook 'ido-make-buffer-list-hook 'my-ido-make-buffer-list-hook)

;; this makes dabbrev-expand not ig
(setq dabbrev-case-fold-search nil)



;;make escape actually escape
;;(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
;;(global-set-key (kbd "<escape>")      'keyboard-escape-quit)
(global-set-key (kbd "<escape>")      'keyboard-quit)


;; uncomment this out if you want crude modal mode
;; (require 'modalka)
;; (setq-default cursor-type 'box)
;; (setq modalka-cursor-type '(bar . 3))

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    ;;(define-key map (kbd "C-d") 'modalka-mode)
    (define-key map (kbd "C-d") 'select-word)
    
    (define-key map (kbd "C-o")     'ido-find-file)
    (define-key map (kbd "C-b")     'ido-switch-buffer)
    (define-key map (kbd "<C-tab>") 'ido-switch-buffer)
    (define-key map (kbd "M-b") 'switch-to-last-buffer)
    ;;(define-key map (kbd "<C-tab>") 'ido-switch-buffer)
    ;; (define-key map (kbd "C-t") 'ff-find-other-ffile)
    ;; (define-key map (kbd "M-t") '*matching-cpp-other-window)
    (define-key map (kbd "C-q") 'query-replace)
    (define-key map (kbd "M-q") 'quoted-insert)
    (define-key map (kbd "C-;") 'other-window)

    (define-key map (kbd "<S-return>") 'other-window)

    
    (define-key map (kbd "<M-f4>")  'kill-emacs)

    ;; by default these go to start and end of buffer, which I always press on accident
    (define-key map (kbd "<home>")   'back-to-indentation)
    ;; (define-key map (kbd "<S-home>") 'back-to-indentation-or-beginning-selection) not sure why this doesn't work
    (define-key map (kbd "<C-home>") 'back-to-indentation-or-beginning)   
    (define-key map (kbd "<C-end>")  'move-end-of-line)
    
    (define-key map (kbd "C-\\") '*expand-region)
    (define-key map (kbd "M-\\") 'recenter-top-bottom)

    (define-key map (kbd "C-j") 'dabbrev-expand) ;; best emacs command by far

    (define-key map (kbd "<C-i>") '*write-scope)
    (define-key map (kbd "M-i")   '*open-braces)
    

    ;; (define-key map (kbd "C-k") '*select-line)
    (define-key map (kbd "C-S-k") 'kill-whole-line)
    (define-key map (kbd "M-k") 'delete-line)
    
    (define-key map (kbd "C-l") 'recenter-top-bottom)
    (define-key map (kbd "M-l") 'duplicate-line)

    
    
    
    (define-key map (kbd "<f1>")   'shell-command)
    (define-key map (kbd "<C-f1>") 'shell-command-on-region)
    ;; (define-key map (kbd "C-g") 'goto-line)

    (define-key map (kbd "C-u") 'undo)
    (define-key map (kbd "C-n") 'xref-find-definitions)
	
    (define-key map (kbd "M-p") 'backward-paragraph)
    (define-key map (kbd "M-n") 'forward-paragraph)
    (define-key map (kbd "C-M-p") 'scroll-down-command)
    (define-key map (kbd "C-M-n") 'scroll-up-command)
	
	
    ;;(define-key map (kbd "C-m") '*open-in-vs)
    (define-key map (kbd "C-t") 'toggle-transparency)

    ;;(define-key map (kbd "C-w") 'kill-region)    ;cut


    
    (define-key map (kbd "<S-SPC>") 'exchange-point-and-mark) 
    (define-key map (kbd "C-e") 'copy-region-or-line) ;; copy
    (define-key map (kbd "C-v") 'yank)           ;;paste
    (define-key map (kbd "M-v") 'yank-pop)       ;;cycle through kill ring
    (define-key map (kbd "C-c") 'copy-region-or-line) ;copy
    (define-key map (kbd "M-o") 'ff-find-other-file)
    
    
    (define-key map (kbd "C-z") 'undo)
    
    (define-key map (kbd "C-s") 'save-buffer)
    (define-key map (kbd "M-s") 'save-some-buffers)


    
    (define-key map (kbd "C-f") 'isearch-forward)
    (define-key map (kbd "C-r") 'isearch-backward)
    (define-key map (kbd "M-f") 'isearch-forward-regexp)
    (define-key map (kbd "M-r") 'isearch-backward-regexp)
    
    
    (define-key map (kbd "<C-prior>") 'previous-error)
    (define-key map (kbd "<C-next>")  'next-error)

    
    ;; identifier means entire word and not sub-word parts 
    (define-key map (kbd "<C-right>") '*forward-identifier) 
    (define-key map (kbd "<C-left>")  '*backward-identifier)
    (define-key map (kbd "<S-C-right>") '*forward-identifier-select) 
    (define-key map (kbd "<S-C-left>")  '*backward-identifier-select)

    ;; moves by sub-word parts
    (define-key map (kbd "<M-right>") 'right-word) 
    (define-key map (kbd "<M-left>")  'left-word)
    (define-key map (kbd "<S-M-right>") '*right-word-select) 
    (define-key map (kbd "<S-M-left>")  '*left-word-select)
    
    (define-key map (kbd "<M-down>")  'move-to-next-function)
    (define-key map (kbd "<M-up>")    'beginning-of-defun)

    (define-key map (kbd "<C-M-left>") 'previous-buffer) 
    (define-key map (kbd "<C-M-right>")  'next-buffer)
    
    (define-key map (kbd "C-,") '*write-underscore)
    (define-key map (kbd "C-.") '*write-pointer-arrow)
    (define-key map (kbd "C-/") 'comment-line)
    ;; (define-key map (kbd "<C-return>") 'ff-find-other-file)
    ;; (define-key map (kbd "<M-return>") '*matching-cpp-other-window)
    (define-key map (kbd "<f5>")       'make-without-asking)
	
    (define-key map (kbd "M-`")       'goto-line)
    (define-key map (kbd "C-`")       'universal-argument)

    (define-key map (kbd "C-1")       'delete-other-windows)
    ;; (define-key map (kbd "C-2")       'split-window-below)
    ;; (define-key map (kbd "C-3")       'split-window-right)
    (define-key map (kbd "C-2") (lambda () (interactive)(split-window-below) (other-window 1)))
    (define-key map (kbd "C-3") (lambda () (interactive)(split-window-right) (other-window 1)))
    (define-key map (kbd "M-2") (lambda () (interactive)(split-window-below) (other-window 1) (ff-find-other-file)))
    (define-key map (kbd "M-3") (lambda () (interactive)(split-window-right) (other-window 1) (ff-find-other-file)))
    (define-key map (kbd "C-0")       'delete-window)


    (define-key map [(insert)]         'c-hungry-delete-forward)
    (define-key map [(control insert)] 'c-hungry-delete-backwards)

    (define-key map [M-backspace]   '*backspace-word) ;;sub words
    (define-key map [M-delete]      '*delete-word)
    (define-key map [C-backspace]   '*backspace-identifier) ;;big words
    (define-key map [C-delete]      '*delete-identifier)
    (define-key map [C-M-backspace] 'c-hungry-delete-backwards)
    (define-key map [C-M-delete]    'c-hungry-delete-forward)
    
    map)
  "my-keys-minor-mode keymap.")

(defun switch-to-last-buffer()
  "Switch to last used buffer"
  (interactive)
  (switch-to-buffer nil))

(defun move-to-next-function()
  "Switch to last used buffer"
  (interactive)
  (beginning-of-defun -1))


(defun select-word ()
  "Select a word under cursor.
   “word” here is considered any alphenumeric sequence with “_” or “-”."
  (interactive)
  (let (b1 b2)
    (skip-chars-backward "-_A-Za-z0-9")
    (setq b1 (point))
    (skip-chars-forward "-_A-Za-z0-9")
    (setq b2 (point))
    (set-mark b1)
    )
  )

 (defun back-to-indentation-or-beginning () (interactive)
   (if (= (point) (progn (back-to-indentation) (point)))
       (beginning-of-line)))

(defun back-to-indentation-or-beginning-selection () (interactive)
       ;; set mark if not set already
       (when (not (use-region-p)) 
         (set-mark-command (point)))
       (if (= (point) (progn (back-to-indentation) (point)))
           (beginning-of-line)))

(defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(85 . 50) '(100 . 100)))))
		  
;; taken from xahlee
(defun delete-line ()
  "Delete text from current position to end of line char.
This command does not push text to `kill-ring'."
  (interactive)
  (beginning-of-line 1)
  (delete-region
   (point)
   (progn (end-of-line 1) (point)))
  (delete-char 1))

(defun *open-braces ()
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

(defun *backward-identifier ()
  "Move over the following word or non-word characters backwards"
  (interactive)
  (superword-mode  1)
  (left-word)
  (superword-mode -1))

(defun *forward-identifier ()
  "Move over the following word or non-word characters."
  (interactive)
  (superword-mode  1)
  (right-word)
  (superword-mode -1))

(defun *backward-identifier-select ()
  "Move over the following word or non-word characters backwards"
  (interactive)
  (superword-mode  1)
  (setq this-command-keys-shift-translated t)
  (call-interactively 'left-word)
  (superword-mode -1))

(defun *forward-identifier-select ()
  "Move over the following word or non-word characters."
  (interactive)
  (superword-mode  1)
  (setq this-command-keys-shift-translated t)
  (call-interactively 'right-word)
  (superword-mode -1))

(defun *left-word-select ()
  "Move over the following word or non-word characters backwards"
  (interactive)
  (setq this-command-keys-shift-translated t)
  (call-interactively 'left-word))

(defun *right-word-select ()
  "Move over the following word or non-word characters."
  (interactive)
  (setq this-command-keys-shift-translated t)
  (call-interactively 'right-word))





;;isearch stuff
(define-key isearch-mode-map (kbd "<C-return>")   'isearch-exit-leave-selection)
;;(define-key isearch-mode-map (kbd "<C-backspace>") 'isearch-clear-string)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(define-key isearch-mode-map "\C-r" 'isearch-repeat-backward)
(define-key isearch-mode-map (kbd "C-,") '*isearch-underscore)
(define-key isearch-mode-map (kbd "C-.") '*isearch-pointer-arrow)

;; (global-set-key (kbd "<return>") 'newline) this makes jumping in readonly buffers break
(define-key minibuffer-local-map (kbd "<return>") 'exit-minibuffer)



;;taken from stack overflow anser
;; (defun isearch-exit-leave-selection ()
;;   "Exit isearch and mark the current match."
;;   (interactive)
;;   (isearch-exit)
;;   (push-mark isearch-other-end)
;;   (activate-mark))


(defun isearch-clear-string ()
  (interactive)

  ;; this does infinite loop
   ;; (while (length isearch-string)
   ;;   (isearch-del-char)
   ;;   )

  ;; for some reason this doesn't work...
  ;; (setq isearch-string "")
  ;; (isearch-search-and-update)
  ;; (isearch-search)
  ;; (isearch-push-state)
  ;; (isearch-update)

  ;; only way to do this?...
  (isearch-abort)
  (isearch-forward)

  ;; nope that doesn't work either....
  )

(defun isearch-exit-leave-selection ()
  (interactive)
  (isearch-done)
  (push-mark isearch-other-end 'no-message 'activate))

;;(define-key minibuffer-local-must-match-map (kbd "ESC")   'exit-minibuffer)
;; (define-key  minibuffer-local-must-match-map           (kbd "C-g")   'abort-recursive-edit)
;; (define-key  minibuffer-local-map                      (kbd "C-g")   'abort-recursive-edit)
;; (define-key  minibuffer-local-ns-map                   (kbd "C-g")   'abort-recursive-edit)
;; (define-key  minibuffer-local-completion-map           (kbd "C-g")   'abort-recursive-edit)
;; (define-key  minibuffer-local-filename-completion-map  (kbd "C-g")   'abort-recursive-edit)

(define-key  minibuffer-local-must-match-map           (kbd "ESC")   'abort-recursive-edit)
(define-key  minibuffer-local-map                      (kbd "ESC")   'abort-recursive-edit)
(define-key  minibuffer-local-ns-map                   (kbd "ESC")   'abort-recursive-edit)
(define-key  minibuffer-local-completion-map           (kbd "ESC")   'abort-recursive-edit)
(define-key  minibuffer-local-filename-completion-map  (kbd "ESC")   'abort-recursive-edit)



(define-key minibuffer-local-must-match-map (kbd "C-j")   'minibuffer-complete)
(define-key minibuffer-local-must-match-map (kbd "C-,")   '*write-underscore)
(define-key minibuffer-local-must-match-map (kbd "C-.")   '*write-pointer-arrow)

;; uncomment this for modal keybindings
;;modal mode keybindings
;; (define-key modalka-mode-map (kbd "C-d") #'modalka-mode)
;; (define-key modalka-mode-map (kbd "c") #'kill-ring-save)
;; (define-key modalka-mode-map (kbd "x") #'kill-region)
;; (define-key modalka-mode-map (kbd "v") #'yank)
;; (define-key modalka-mode-map (kbd "e") #'previous-line)
;; (define-key modalka-mode-map (kbd "d") #'next-line)

;; (define-key modalka-mode-map (kbd "s") #'*backward-identifier)
;; (define-key modalka-mode-map (kbd "f") #'*forward-identifier)
;; (define-key modalka-mode-map (kbd "w") #'left-word)
;; (define-key modalka-mode-map (kbd "r") #'right-word)
;; (define-key modalka-mode-map (kbd "q") #'left-char)
;; (define-key modalka-mode-map (kbd "t") #'right-char)


;; (define-key modalka-mode-map (kbd "a") #'back-to-indentation)
;; (define-key modalka-mode-map (kbd "g") #'move-end-of-line)

;; (define-key modalka-mode-map (kbd "/")   #'comment-line)
;; (define-key modalka-mode-map (kbd ";")   #'other-window)
;; (define-key modalka-mode-map (kbd "'")   #'*expand-region)
;; (define-key modalka-mode-map (kbd "l")   #'recenter-top-bottom)
;; (define-key modalka-mode-map (kbd "C-l") #'move-to-window-line-top-bottom)

;; (define-key modalka-mode-map (kbd "SPC") #'set-mark-command)
;; (define-key modalka-mode-map (kbd "C-SPC") #'exchange-point-and-mark)
;; (define-key modalka-mode-map (kbd "k") #'*select-line)
;; (define-key modalka-mode-map (kbd "C-k") #'kill-line)



(defalias 'hsplit     'split-window-vertically)
(defalias 'vsplit     'split-window-horizontally)
(defalias 'kill-window        'delete-window)
(defalias 'kill-other-windows 'delete-other-windows)
(defalias 'kill-tab        'tab-bar-close-tab)
(defalias 'kill-other-tabs 'tab-bar-close-other-tabs)

(require 'cc-mode)
(setq c-default-style "linux" c-basic-offset 4)
(c-set-offset (quote cpp-macro) 0 nil)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))









;; (font-lock-add-keywords 'c++-mode
;; 			'(("\\<\\([a-zA-Z_0-9]*\\) *("  1 font-lock-preprocessor-face)))


;; (define-key input-decode-map "\C-i" [C-i])
;; (define-key c-mode-base-map (kbd "C-i")   '*write-scope)

(define-key input-decode-map [?\C-i] [C-i])



(define-key c-mode-base-map (kbd "<tab>")   'indent-for-tab-command)
(define-key c-mode-base-map (kbd "<C-M-left>")  'c-beginning-of-defun)
(define-key c-mode-base-map (kbd "<C-M-right>") 'c-end-of-defun)

;; (setq local-function-key-map (delq '(kp-tab . [9]) local-function-key-map))
;; (global-set-key (kbd "C-i") '*write-scope)


;; (require 'org)
;; (add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :global t
  :lighter " milo")

(my-keys-minor-mode 1)

(defun *only-window ()
  (interactive)
  (delete-other-windows))

(defun *select-line ()
  (interactive)
  (back-to-indentation) ;(beginning-of-line)
  (set-mark-command nil)
  (end-of-line))

(defun duplicate-line()
  (interactive)
  (let ((init_col (current-column)))

    (move-beginning-of-line 1)
    (kill-line)
    (yank)
    (open-line 1)
    (next-line 1)
    (yank)
    (move-to-column init_col)))

(defun copy-region-or-line()
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

  
  

(defun *expand-region ()
  (interactive)
  (backward-up-list) 
  (mark-sexp))

(defun *contract-region ()
  (interactive)
  (down-list) 
  (mark-sexp))



(defun *tab-new ()
  (interactive)
  (tab-bar-new-tab)
  (ido-find-file))
                                        ;(split-window-right)
                                        ;(*matching-cpp-other-window)
                                        ;(other-window 1))


(defun *align-by-whitespace ()
  "Align columns by whitespace"
  (interactive)
  (if (not (use-region-p))
      (*select-line))
                                        ;(align-regexp (mark) (point)   "\\(\\s-*\\)\\s-" 1 0 t))
                                        ;(align-regexp (mark) (point)   "\\(\\s-*\\):" 1 1 t))
                                        ;  (align-regexp  (mark) (point)   "\\S-+\\(\\s-+\\)" 1 2 nil))
  (align-regexp  (mark) (point)  "\\S-+\\(\\s-+\\)" 1 1 nil))

(defun yank-and-indent ()
  "Yank and then indent the newly formed region according to mode."
  (interactive)
  (yank)
  (call-interactively 'indent-region))

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

(defun *delete-identifier (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (superword-mode  1)
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point)))
  (superword-mode  -1))

(defun *backspace-identifier (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (*delete-identifier (- arg)))

(defun vs ()
  (interactive)
  (kill-new (number-to-string (line-number-at-pos)))
  (shell-command (concat "devenv /Edit " (buffer-file-name (window-buffer (minibuffer-selected-window))))))

(defun *tab-right ()
  (interactive)
  (tab-bar-switch-to-next-tab))

(defun *tab-left ()
  (interactive)
  (tab-bar-switch-to-prev-tab))



(defun *write-underscore ()      (interactive) (insert "_"))

(defun *write-pointer-arrow ()   (interactive) (insert "->"))

(defun *isearch-underscore ()    (interactive) (isearch-yank-string "_"))

(defun *isearch-pointer-arrow () (interactive) (isearch-yank-string "->"))

                                        ;(defun *write-scope ()
                                        ;  (interactive)
                                        ;  (push-mark)
                                        ;  (insert "\n{\n\n}")
                                        ;  (indent-region (mark) (point))
                                        ;  (pop-mark))

(defun *write-scope ()
  (interactive)
  (let ((linestr (thing-at-point 'line)))
    (if (string-match (rx (or "struct" "union" "enum") (one-or-more whitespace)) linestr)
	(progn ;if we are declaring struct|union|enum scope
	  (push-mark)
	  (insert "{\n\n};")
	  (indent-region (mark) (point))
	  (pop-mark)
	  (previous-line)
	  (indent-for-tab-command))
      (if (string-match (rx "case" (one-or-more whitespace)) linestr)
	  (progn ;we are declaring a case scope
	    (push-mark)
	    (insert "{\n\n} break;")
	    (indent-region (mark) (point))
	    (pop-mark)
     	    (previous-line)
	    (indent-for-tab-command))
	(progn ;regular ol' scope
	  (push-mark)
	  (insert "{\n\n}")
	  (indent-region (mark) (point))
	  (pop-mark)
     	  (previous-line)
	  (indent-for-tab-command))))))


(defun *indent-buffer ()
  (interactive)
  (mark-whole-buffer)
  (indent-region (region-beginning) (region-end)))

(defun .emacs ()
  (interactive)
  ;; TODO isn't there like a ROOT variable or something to take us to default directory?...
  (find-file "D:/emacs/lisp/.emacs"))

(defun *open-code ()
  (interactive)
  (let ((filenames (directory-files default-directory nil)) (buffer-id (current-buffer)) (ext))
    (dolist (filename filenames)
      (setq ext (file-name-extension filename t))
      (if (or (string= ext ".cpp") (string= ext ".h") (string= ext ".c") (string= ext ".hpp"))
	  (find-file filename)))
    (switch-to-buffer buffer-id)))

(defun *view-buffer-other-window ()
  (interactive)
  (switch-to-buffer-other-window (current-buffer)))

(defun *matching-cpp-other-window ()
  (interactive)
  (switch-to-buffer-other-window (current-buffer))
  (ff-find-other-file))





(defvar *type-decl-regexp-string
  (rx (or "struct" "union" "enum") (one-or-more whitespace) (one-or-more word)))

(defvar *function-regexp-string
                                        ;(rx "internal" (one-or-more not-newline) eol ))
                                        ;(rx bol "internal" bol (one-or-more word)))
  (rx bol (one-or-more (or word "_")) "("))

(defvar *special-comment-regexp-string
  (rx "//>"))

(defun *list-type-defns ()
  (interactive)
  (occur *type-decl-regexp-string))

(defun *list-functions ()
  (interactive)
  (occur *function-regexp-string))

(defun *list-special-comments ()
  (interactive)
  (occur *special-comment-regexp-string))

(defun *list-type-defns-all-buffers ()
  (interactive)
  (multi-occur *type-decl-regexp-string))

(defun *list-functions-all-buffers ()
  (interactive)
  (multi-occur *function-regexp-string))

(defun *list-special-comments-all-buffers ()
  (interactive)
  (multi-occur *special-comment-regexp-string))



;; (defun unpop-global-mark ()
;;   "Unpop off mark ring. Does nothing if mark ring is empty."
;;   (interactive)
;;   (when global-mark-ring
;;     (let ((pos (marker-position (car (last global-mark-ring)))))
;;       (if (not (= (point) pos))
;;           (goto-char pos)
;;         (setq global-mark-ring (cons (copy-marker (mark-marker)) global-mark-ring))
;;         (set-marker (mark-marker) pos)
;;         (setq global-mark-ring (nbutlast global-mark-ring))
;;         (goto-char (marker-position (car (last global-mark-ring))))))))

(defun unpop-global-mark ()
  "Unpop off mark ring. Does nothing if mark ring is empty."
  (interactive)
      (when global-mark-ring
        (setq global-mark-ring (cons (copy-marker (mark-marker)) global-mark-ring))
        (set-marker (mark-marker) (car (last global-mark-ring)) (current-buffer))
        (when (null (mark t)) (ding))
        (setq global-mark-ring (nbutlast global-mark-ring))
        (switch-to-buffer (marker-buffer (car (last global-mark-ring)))) ;;added this to make it work with global mark ring
        (goto-char (marker-position (car (last global-mark-ring))))))

;; mark ring stuff
(setq mark-ring-max 6)
(setq global-mark-ring-max 6)

(global-set-key (kbd "<f7>") 'xah-pop-local-mark-ring)
(global-set-key (kbd "<f8>") 'pop-global-mark)

(defun xah-pop-local-mark-ring ()
  "Move cursor to last mark position of current buffer.
   Call this repeatedly will cycle all positions in `mark-ring'.
   URL `http://xahlee.info/emacs/emacs/emacs_jump_to_previous_position.html'
   Version 2016-04-04"
  (interactive)
  (set-mark-command t))



;;NOTE this was taken from Handmade Hero, thank you Casey!
(require 'compile)
(setq compilation-ask-about-save nil) ; don't ask to save every file when compiling
(setq compilation-directory-locked nil)
(setq compilation-context-lines 0)
(setq compilation-error-regexp-alist
      (cons '("^\\([0-9]+>\\)?\\(\\(?:[a-zA-Z]:\\)?[^:(\t\n]+\\)(\\([0-9]+\\)) : \\(?:fatal error\\|warnin\\(g\\)\\) C[0-9]+:" 2 3 nil (4))
            compilation-error-regexp-alist))


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

(defun *list-code-indexes ()
  "Make the current build."
  (interactive)
  (tab-bar-select-tab 1)
  (switch-to-buffer-other-window "*compilation*")
  (compile "list_indexes.bat")
  (other-window 1))

;; Bright-red TODOs NOTE
;; (setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
;; (make-face 'font-lock-fixme-face)
;; (make-face 'font-lock-nocheckin-face)
;; (make-face 'font-lock-speed-face)
;; (make-face 'font-lock-note-face)

;; (mapc (lambda (mode)
;; 	(font-lock-add-keywords
;; 	 mode
;; 	 '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
;;            ("\\<\\(nocheckin\\)" 1 'font-lock-study-face t)
;;            ("\\<\\(SPEED\\)" 1 'font-lock-important-face t)
;;            ;; ("\\(~^&\|!<>:=,.\\+*/%-]\\)" 0 'font-lock-operator-face t)
;;            ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
;;       fixme-modes)
;; (modify-face 'font-lock-fixme-face     "coral"      nil nil t nil nil nil nil)
;; (modify-face 'font-lock-nocheckin-face "pink"       nil nil t nil t nil nil)
;; (modify-face 'font-lock-speed-face     "SteelBlue1" nil nil t nil t nil nil)
;; (modify-face 'font-lock-note-face      "lime green" nil nil t nil nil nil nil)

(defface font-lock-format-specifier-face
  '((t . (:inherit font-lock-regexp-grouping-backslash
	 :foreground "coral")))
  "Font-lock face used to highlight printf format specifiers."
  :group 'font-lock-faces)

(defvar printf-fmt-regexp
  (concat "\\(%"
	  "\\([[:digit:]]+\\$\\)?"   ; Posix argument position extension.
	  "[-+' #0*]*"
	  "\\(?:[[:digit:]]*\\|\\*\\|\\*[[:digit:]]+\\$\\)"
	  "\\(?:\\.\\(?:[[:digit:]]*\\|\\*\\|\\*[[:digit:]]+\\$\\)\\)?"
	  "\\(?:[hlLjzt]\\|ll\\|hh\\)?"
	  "\\(?:[aAbdiuoxXDOUfFeEgGcCsSpn]\\|\\[\\^?.[^]]*\\]\\)\\)")
  "Regular expression to capture all possible `printf' formats in C/C++.")

(defun printf-fmt-matcher (end)
  "Search for `printf' format specifiers within strings up to END."
  (let ((pos)
	(case-fold-search nil))
    (while (and (setq pos (re-search-forward printf-fmt-regexp end t))
		(null (nth 3 (syntax-ppss pos)))))
    pos))



;;(add-hook 'c-mode-common-hook 'adaptive-wrap-prefix-mode)
;;(add-hook 'c-mode-common-hook 'which-function-mode)

(font-lock-add-keywords 'c++-mode '(("defer" . font-lock-keyword-face)))

;;(add-hook 'c-mode-common-hook (lambda ()
;;  (font-lock-add-keywords nil         
;;    '(("[<>{}():&*=+^%!~,.?;/-]" 0 font-lock-keyword-face t)))
;;  ))

(defface font-lock-operator-face
  '((t . (:inherit font-lock-regexp-grouping-backslash
	 :foreground "coral")))
  "Font-lock face used to highlight printf format specifiers."
  :group 'font-lock-faces)


(defun my-cc-mode-common-hook ()
  "Setup common utilities for all C-like modes."

  (adaptive-wrap-prefix-mode)
  (which-function-mode)
  
  (font-lock-add-keywords
   nil
   '((printf-fmt-matcher (0 'font-lock-format-specifier-face prepend))))

  (font-lock-add-keywords
   nil
   '(("[<>{}():&*=+^%!~,.?;/-]" (0 'font-lock-operator-face prepend))))

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



;; (require 'gruvbox)
;; (load-theme 'gruvbox-dark-medium t)
(load-theme 'luis t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   '("98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd" "a5270d86fac30303c5910be7403467662d7601b821af2ff0c4eb181153ebfc0a" "6e8a0ce537d32f68d066ed62ad4bb2a5330e5f7cb44050e748329ea93a338c94" "09ac461515637deb84c32973d7bf7fa9cb234088c7d489fde18affa0748f144e" "b9ab09cc7c2ad84852daed432fded855bb8ff7b09675bdbee39b5260fd1bf0ed" "2647e9a7a6c25d35b6448029beba0f4b3bcaa1a3b289934f639a1ab21a6c7f99" "b1601b04550292648fab0e643e45446624be9ac63ca6409fd8ce30b5a81d19da" "8a3f5a174d94b93d05dfb8e09290b0968c59a7af124faf9a6158d0b43e8365f0" "6e4a6e6571fd203415c796f6e4f63f91eee366939fae03b6413464eace8c6ba4" "9d5c78b769ae5a518a18d089702e6603cb47dff91261a23a75b44442de22409a" "7157671804fbd892e2ee91b1f62528ceef953dc41db895ee731b6842b1d06709" "fd16f73ed6f6008abd89b67576cdc631079783baeb8143471d9946a2c4445d50" "c93e381ae4b434baf887fc67774fafdb8e9190127dbed19272c4db4a56763cdd" "ae49a08f49297572c9c8aab7f3160b58c5625e741333c57c63c94bbd46f09146" "8e24b7ec386f7d89f0e2539ce7325de4007ea34823163cb2f686182b2a267ae2" "8f2c6ffee09810e73f05de46adc6f02ab61896ee2ad1a908775426c3800adc5c" "6769ad1ac8b194764b787d27eb01050806d2767b06277850a3b74c33d6f1a328" "271002a3be9228f05dea4a6d94d746d58a2e8ae9d364501f236330207b31205e" "33f5de318793506f9ef536599d70b397270fbd828261e73a31de2d1dd5ddae3a" "157d0358d05efa4b961afa0581c65687ff13cb2d1cb83c3353f090bf60295495" "ab3f62f579f2d724d40a1613747456793f23adf5ed7ee55d4672a556750a6163" "b525b12495a01386a81fac8ed4049c1a6df498efc12127c347ddfb7b56475694" "0386ddc4cc5510c267cfbb149e62eedea957c7646ccf0d7102ccc5bfa90fbf15" "6a02d9b418299c1d527f0de6abc1e4fba9f66bee63f46763dad9387ae51be0c5" "9f4bf44909d6b44aa6b5e50214c09d0334f0dbd01f14c959e84219fbd9d34c4c" "c35d001ad9ced8312d366cba9ec60830be9204f68a924db346ba2c66bc2c5c16" "637b800a3372417a6d8af7e37b82431dd70cbb320ea6e835116b5d2d0db9b917" "e646401e2b9082a52840e544c1e316a5da341b28258f1652635e4f272b0f7dd7" "6bbc81f5d649b5be54c62d87fd344859ddcb87fc13d1d818bea67d8432e4852a" "2ee727e158dbef13a0ca6b0ed91ff66aa6cf4504d19a39e8b21ef5d8530579d5" "b5a2ed50c58b90ef97fad2990e90576622f48e5017a060088f3cdcd632d1a13b" "179901aae6a8397742a86ef59fe6af955ed06c6e24255f233dd694a4dbbccbfa" "d14d7f3b845451a520928867c6914667530559cd01dad0afd8387acbeca7c7cd" "87494ebf1ee5b563ca66922e26733257a4740a8baa597e11beec8c7d36b56062" "c47ecf7d009dfd2099c90fee3961625cbc5f7bf7e4da6d3a389288f61b2f88da" "bc50b4913388e1a80d4455340220e88c14f774ec0acec82208f6adfd10f41af0" "2105b1180a465cb8237a74109dac83f3303666c5fa17eeaf7db28e247ad0e37f" "9ebc080e0b45c1cb80859be710ff90d08a4b9d619e8a19a9cac713026fe0a55c" "32f1ec2cc499f25cb87dabbd7512d1652ffe299d4e53561b527e6b914e9a802c" "b9af3b9787360ac31402ee8192ca69218d0fbefb9a620b085d8caf5ad35ae804" "00d2050dfa49de7f17757183587d3910c6d235476d326a4964e95572b00523b7" "f3f7abc1a74c4054f1aec1e601062ebd9fb2bfc069b278b9aba2c5548577e269" "fa34c27f43e4fe06c15876a16ac00c1cb1960b7f262b5751db42e5a18200d006" "09e3e26cfefd10a729a558db1166e9c80eaecffd7e5618180710f8faa8bc3e4b" "c82d90c10d50649f67433509d90438eef96d81604c03b7be45b8901c7e031a58" "5861d373ea1b424276ef8826df4178a3d727dd4461f472ab6f34107cb0f449ee" "f6b63a655dcd5f172c843a621d4dfff1daca77fbec16fbfc806c600e3a3d3d0a" "c81c909aba6cbef634de135c82370d8f37d2beb2d52980164377c36dda540c83" "2bd078e88a12930a53760c29dd06efb982bd963d7945a615f0b9d5323dc7289a" "877d24c47f77c1094cacc1ff4a268267097b72e20b2dd457529a95c8bc998c25" "b2d0a5ecf5d089a15242ed2809f7a5c955d67cf3ca5ac389da5e195276b2abcb" "b921e11308c82ce6b78dd9d2ce9db3881fe79803d771b78028fd5b5287d440fe" "fdde9bc2bc98bd5d28975936fd2cd0646cb029839e4f9ecec02f09921973950f" "92b0de8b49b8ac9e7e61b0fe805f189de6726e359ca4d3e0a6ed5315c1e71ae0" "067bddb1110bdb585163b7a21ed4c55917a7ec20582a2b8051c2b2d0894f673e" "abb5dd6b3f5242588ecac3eec7a8784954ec50cf257e412fdfef40594e11d9a7" "3bb510d94d63e268bdb14bb49b715f094639d41ae4bfa2f06292018dff8d7a21" "a61ee5ad0bf68f59175c7691f10e2ea806b700047dc7f7b115882a0cb1a4be8c" "57ab479a1e545e6fcb24220d70cae33addb38b8f5314f843d859f1a8003a427f" "1d51919e9a075a4f56396681dc99adecefa152ab29819178403cbf6ae5bc0dd8" "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" "046a2b81d13afddae309930ef85d458c4f5d278a69448e5a5261a5c78598e012" "ba323a013c25b355eb9a0550541573d535831c557674c8d59b9ac6aa720c21d3" "7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98" "871b064b53235facde040f6bdfa28d03d9f4b966d8ce28fb1725313731a2bcc8" "18d1131ad6ff8e8e34287d6de9299faba4f1b03874278463fb6f38e3abe65bdc" "03c4e8564de86c914e0cc83a04fefd8c0f86a6905c8a0ceaf9a102bc31451779" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "fd029ad4c1213f32dbd50acfd4aead9aafc7b62d00c5bc6237ccb2bc028fabd1" "ea5822c1b2fb8bb6194a7ee61af3fe2cc7e2c7bab272cbb498a0234984e1b2d9" "a53c7ff4570e23d7c5833cd342c461684aa55ddba09b7788d6ae70e7645c12b4" default))
 '(fci-rule-color "#383838")
 '(linum-format " %5i ")
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages '(backward-forward gruvbox-theme))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
