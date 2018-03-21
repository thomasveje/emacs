(require 'req-package)

(req-package atomic-chrome
  :ensure t
  :pin melpa-stable
  :config
  (atomic-chrome-start-server))

(provide 'init-atomic-chrome)
