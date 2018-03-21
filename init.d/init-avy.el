(require 'req-package)

(req-package avy
  :ensure t
  :pin melpa-stable
  :config
  ;; Easy jumping in visible portion of Emacs.
  (global-set-key (kbd "M-s") 'avy-goto-word-or-subword-1))

(provide 'init-avy)
