(require 'racket-mode)
(require 'racket-xp)
(require 'rainbow-delimiters)
(require 'rainbow-identifiers)
(require 'highlight-indent-guides)

(add-hook 'racket-mode-hook 'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook 'rainbow-identifiers-mode)
(add-hook 'racket-mode-hook 'highlight-indent-guides-mode)
(add-hook 'racket-mode-hook 'racket-xp-mode)

(add-to-list 'auto-mode-alist '("\\.rkt\\'\" . racket-mode))"))
