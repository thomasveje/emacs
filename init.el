;(package-initialize)

(require 'package)

;; bootstrap utils

(setq package-enable-at-startup nil)
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

;; Interactive-Do-Things
;; https://www.emacswiki.org/emacs/InteractivelyDoThings#toc1
;(ido-mode 1)
;(setq ido-enable-flex-matching t)
;(setq ido-everywhere t)

;; Newline AND indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; highlight current line
(global-hl-line-mode 1)

;; pair paranthesis etc.
(electric-pair-mode 1)

;; refresh files every 5 seconds
(global-auto-revert-mode t)

;; use aspell as spell checker
(setq ispell-program-name "/usr/bin/aspell")

;; font
;;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono:pixelsize=15" ))

;; theme
;;(load-theme 'material t)

;; more sensitive file finding defaults 
(ffap-bindings)

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


;; load extensions

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init-real.el")))
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    (quote
;;     ("732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" default)))
;;  '(fill-column 69)
;;  '(package-selected-packages
;;    (quote
;;     (haskell-mode openwith helm-bibtex find-file-in-project yasnippet ivy flycheck company use-package auto-package-update airplay material-theme company-auctex atomic-chrome wgrep-helm helm-themes helm-descbinds helm-swoop helm-helm-commands ace-jump-helm-line fsharp-mode elpy vy wgrep helm-gitignore flycheck-pos-tip expand-region edit-server helm-company avy graphviz-dot-mode load-dir req-package use-package-chords use-package-el-get makefile-runner))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm gh-md find-file-in-project flycheck auctex yasnippet ivy wgrep company avy use-package wgrep-helm use-package-el-get use-package-chords spinner req-package page-break-lines openwith material-theme markdown-mode magit-popup load-dir irony hydra helm-themes helm-swoop helm-helm-commands helm-gitignore helm-descbinds helm-company helm-bibtex haskell-mode graphviz-dot-mode git-commit fsharp-mode flycheck-pos-tip expand-region elpy edit-server company-auctex auto-package-update atomic-chrome airplay ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
