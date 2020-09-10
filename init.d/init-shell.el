(require 'req-package)

(req-package company-shell
  :ensure t
  :pin melpa-stable
  :require (company dash)
  :config
  (add-to-list 'company-backends '(company-shell company-shell-env)))

(provide 'init-shell)
