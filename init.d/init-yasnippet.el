(require 'req-package)

(req-package yasnippet
  :ensure t
  :pin melpa-stable
  :config (yas-global-mode))

(req-package yasnippet-snippets
  :ensure t
  :pin melpa-stable
  :require yasnippet)

(provide 'init-yasnippet)
