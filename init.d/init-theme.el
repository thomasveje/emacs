(require 'req-package)

(req-package material-theme
  :ensure t
  :pin melpa-stable
  :config
  (load-theme 'material t))

(provide 'init-themes)
