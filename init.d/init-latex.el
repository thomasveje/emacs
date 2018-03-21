(require 'req-package)

(add-to-list 'load-path "/home/thomas/git-installs/company-auctex/company-auctex.el")

(req-package company-auctex
  :ensure t
  :require yasnippet company
  :config
  (company-auctex-init)
  (setq-default TeX-master nil) ; Query for master file.
  (setq-default TeX-PDF-mode t))

(req-package yasnippet
  :ensure t
  :config)



(eval-after-load "tex" 
  '(setcdr (assoc "LaTeX" TeX-command-list)
          '("%`%l%(mode) -shell-escape%' %t"
          TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX")
    )
  )

(provide 'init-latex)
