(require 'req-package)

(req-package fsharp-mode
  :ensure t
  :require (company popup pos-tip flycheck)
  :pin melpa-stable)

(provide 'init-fsharp)
