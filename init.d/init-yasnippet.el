(require 'req-package)

(req-package yasnippet
  :ensure t
  :config (yas-global-mode)
  :pin melpa-stable)

(provide 'init-yasnippet)
