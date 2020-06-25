(require 'req-package)

(req-package haskell-mode
  :ensure t
  :pin melpa-stable)

(req-package flymake-hlint
  :ensure t
  :pin melpa-stable
  :require (flymake-easy))

;; (req-package intero
;;   :ensure t
;;   :require (flycheck company haskell-mode)
;;   :pin melpa
;;   :config (add-hook 'haskell-mode-hook 'intero-mode))

(provide 'init-haskell-mode)
