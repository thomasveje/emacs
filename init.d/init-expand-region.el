(require 'req-package)

(req-package expand-region
  :ensure t
  :pin melpa-stable
  :config
  (global-set-key (kbd "C-c m") 'er/expand-region))

(provide 'init-expand-region)
