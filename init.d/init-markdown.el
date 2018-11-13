(require 'req-package)

(req-package gh-md
  :ensure t
  :pin melpa)

(req-package markdown-mode
  :ensure t
  :pin melpa-stable)

(provide 'init-markdown)
