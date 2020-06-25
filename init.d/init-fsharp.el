(require 'req-package)

(req-package fsharp-mode
  :ensure t
  :require (s dash eglot)
  :pin melpa-stable)

(req-package s
  :ensure t
  :pin melpa-stable)

(req-package dash
  :ensure t
  :pin melpa-stable)

(req-package eglot
  :ensure t
  :pin melpa-stable)


(provide 'init-fsharp)
