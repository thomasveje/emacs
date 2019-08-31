(require 'req-package)

(req-package gh-md
  :ensure t
  :pin melpa)

(req-package markdown-mode
  :ensure t
  :pin melpa-stable)

(req-package flymd
  :ensure t
  :config
   (defun my-flymd-browser-function (url)
   (let ((browse-url-browser-function 'browse-url-firefox))
     (browse-url url)))
 (setq flymd-browser-open-function 'my-flymd-browser-function))

(provide 'init-markdown)
