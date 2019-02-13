(require 'req-package)

(req-package tablist
  :ensure t
  :pin melpa-stable)

(req-package pdf-tools
  :require tablist
  :ensure t
  :pin melpa-stable
  :config
  (pdf-tools-install)
  (add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1))))

(provide 'init-pdf-tools)
