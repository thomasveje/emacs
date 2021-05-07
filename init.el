;(package-initialize)

(require 'package)

;; bootstrap utils

(defconst my-custom-file "~/.emacs.d/custom.el")

(setq custom-file my-custom-file)
(setq package-enable-at-startup nil)
(load my-custom-file t)
;(setq auto-save-default nil)
;(setq make-backup-files nil)
;(put 'erase-buffer 'disabled nil)

;; turn off startup screen

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Remove toolbar
(tool-bar-mode -1)

;; Enable line numbers
(global-linum-mode 1)

;; Enable column numbers
(setq column-number-mode t)

;; Newline AND indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; highlight current line
(global-hl-line-mode 1)

;; pair paranthesis etc.
(electric-pair-mode 1)

;; refresh files every 5 seconds
(global-auto-revert-mode t)

;;use larger font
(setq default-frame-alist '((font . "Source Code Pro-14")))

;; use aspell as spell checker
(setq ispell-program-name "aspell")

;; redirect backups and autosaves
(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/tmp")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/tmp/" t)))

;; indent with 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq default-tab-width 4)

;; highlight matching brackets with no delay
(setq show-paren-delay 0)
(show-paren-mode 1)

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)


;; ------ insert file path ----

  (defun my-insert-file-name (filename &optional args)
    "Insert name of file FILENAME into buffer after point.
  
  Prefixed with \\[universal-argument], expand the file name to
  its fully canocalized path.  See `expand-file-name'.
  
  Prefixed with \\[negative-argument], use relative path to file
  name from current directory, `default-directory'.  See
  `file-relative-name'.
  
  The default with no prefix is to insert the file name exactly as
  it appears in the minibuffer prompt."
    ;; Based on insert-file in Emacs -- ashawley 20080926
    (interactive "*fInsert file name: \nP")
    (cond ((eq '- args)
           (insert (file-relative-name filename)))
          ((not (null args))
           (insert (expand-file-name filename)))
          (t
           (insert filename))))
  
  (global-set-key "\C-c\C-i" 'my-insert-file-name)

(defun xah-open-in-external-app ()
  "Open the current file or dired marked files in external app.
The app is chosen from your OS's preference.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2016-10-15"
  (interactive)
  (let* (
         ($file-list
          (if (string-equal major-mode "dired-mode")
              (dired-get-marked-files)
            (list (buffer-file-name))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda ($fpath)
           (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" $fpath t t))) $file-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (concat "open " (shell-quote-argument $fpath))))  $file-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda ($fpath) (let ((process-connection-type nil))
                            (start-process "" nil "xdg-open" $fpath))) $file-list))))))

;; load extensions

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init-real.el")))
