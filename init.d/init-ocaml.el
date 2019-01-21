(require 'req-package)

(req-package caml
  :ensure t
  :pin melpa-stable)

(req-package tuareg
  :ensure t
  :require caml
  :pin melpa-stable)

(provide 'init-ocaml)
