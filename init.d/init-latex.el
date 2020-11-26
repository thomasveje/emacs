(require 'req-package)

(req-package auctex
  :defer t
  :ensure t
  :pin gnu)

(req-package auctex-latexmk
  :ensure t
  :require auctex
  :pin gnu
  :config (auxtex-latexmk-setup))



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
