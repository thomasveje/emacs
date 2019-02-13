(require 'req-package)
(req-package elpy
  :ensure t
  :require (company find-file-in-project yasnippet)
  :pin melpa-stable
  :config
  (elpy-enable)
  (setq elpy-rpc-python-command "python3")
  (setq python-shell-interpreter "python3"))

(provide 'init-elpy)
