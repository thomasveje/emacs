(require 'req-package)

(req-package company
  :ensure t
  :pin melpa-stable
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0))

(provide 'init-company)
