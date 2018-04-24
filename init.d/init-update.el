(require 'req-package)

(req-package auto-package-update
   :ensure t
   :pin melpa-stable
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 4)
   (auto-package-update-maybe))

(provide 'init-update)
