(require 'req-package)

(req-package openwith
  :ensure t
  :pin melpa
  :config
  (openwith-mode t)
  (setq openwith-associations '(("\\.pdf\\'" "evince" (file)))))

(provide 'init-openwith)
