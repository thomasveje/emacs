(require 'req-package)

(req-package helm
  :ensure t
  :require async popup
  :chords ((";l" . helm-bookmarks))
  :bind (("C-x C-b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("C-c y" . helm-show-kill-ring)
         ("C-x C-r" . helm-recentf)
         ("C-x r l" . helm-bookmarks)
         ("C-x r b" . helm-filtered-bookmarks)
         ("M-x" . helm-M-x))
  :config
  (helm-mode 1)
  (setq helm-M-x-fuzzy-match t)
  (global-set-key (kbd "C-c f") 'helm-locate))


(req-package ace-jump-helm-line
  :ensure t
  :commands ace-jump-helm-line
  :require helm
  :init (define-key helm-map (kbd "C-;") 'ace-jump-helm-line))


(req-package helm-gitignore
  :ensure t
  :commands helm-gitignore)

(req-package helm-company
  :ensure t
  :require company
  :commands helm-company
  :config (progn (define-key company-mode-map (kbd "C-:") 'helm-company)
                 (define-key company-active-map (kbd "C-:") 'helm-company)))

(req-package helm-helm-commands
  :ensure t
  :commands helm-helm-commands
  :require helm)

(req-package helm-swoop
  :ensure t
  :commands helm-swoop-from-isearch
  :require helm
  :init (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch))

(req-package helm-descbinds
  :ensure t
  :commands helm-descbinds
  :require helm)

(req-package helm-package
  :commands helm-package
  :require helm)


(req-package wgrep-helm
  :ensure t
  :require (helm wgrep grep))

(req-package wgrep
  :ensure t)


(req-package helm-themes
  :ensure t
  :commands helm-themes
  :require helm)


;; (req-package helm-org-rifle
;;   :ensure t)

(provide 'init-helm)
