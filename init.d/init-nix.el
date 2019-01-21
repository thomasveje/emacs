(require 'req-package)

(req-package nix-mode
  :ensure t
  :pin melpa-stable)

(req-package nixos-options
  :require json
  :ensure t
  :pin melpa-stable)

(provide 'init-nix)

