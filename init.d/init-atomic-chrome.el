(require 'req-package)

(req-package atomic-chrome
  :ensure t
  :pin melpa-stable
  :config
  (atomic-chrome-start-server)
  (setq atomic-chrome-buffer-open-style 'frame))

(provide 'init-atomic-chrome)
