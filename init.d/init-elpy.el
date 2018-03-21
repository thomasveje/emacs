(require 'req-package)
(req-package elpy
  :ensure t
  :require company find-file-in-project
  :pin melpa-stable
  :config
  (elpy-enable)
  (setq elpy-rpc-python-command "python3")
  (setq python-shell-interpreter "python3"))

;; (req-package find-file-in-project
;;   :ensure t
;;   :require ivy
;;   :pin melpa-stable)

(provide 'init-elpy)
