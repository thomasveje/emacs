(require 'req-package)

(req-package auctex
  :defer t
  :pin gnu)

(req-package company-auctex
  :ensure auctex
  :ensure t
  :require yasnippet company
  :config
  (add-to-list 'load-path "/home/thomas/git-installs/company-auctex/company-auctex.el")
  (company-auctex-init)
  ;(setq-default TeX-master nil) ; Query for master file.
  (setq-default TeX-master "master") ; All master files called "master".
  (setq-default TeX-PDF-mode t)
  (setq TeX-parse-self t) ; Enable parse on load.
  (setq TeX-auto-save t) ; Enable parse on save.
  (fset 'mathToText
        (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([123 left 92 116 101 120 116] 0 "%d")) arg)))
  (global-set-key (kbd "C-x t") 'mathToText))


(req-package yasnippet
  :ensure t
  :config)


(eval-after-load "tex" 
  '(setcdr (assoc "LaTeX" TeX-command-list)
          '("%`%l%(mode) -shell-escape%' %t"
          TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX")
    )
  )

(defun detex()
  (interactive)
  (shell-command (format "detex %s | wc -m" buffer-file-name)))

(provide 'init-latex)
