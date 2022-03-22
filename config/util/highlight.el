(require 'highlight-indent-guides)
(require 'rainbow-delimiters)

(setq-default highlight-indent-guides-delay 0
	      highlight-indent-guides-character 9474
	      highlight-indent-guides-responsive 'top
	      highlight-indent-guides-method 'character)

(add-hook 'c++-mode-hook 'rainbow-delimiters-mode)
(add-hook 'c-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook 'rainbow-delimiters-mode)
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'tuareg-mode-hook 'rainbow-delimiters-mode)
(add-hook 'rust-mode-hook 'rainbow-delimiters-mode)

(add-hook 'c++-mode-hook 'highlight-indent-guides-mode)
(add-hook 'c-mode-hook 'highlight-indent-guides-mode)
(add-hook 'lisp-mode-hook 'highlight-indent-guides-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-indent-guides-mode)
(add-hook 'racket-mode-hook 'highlight-indent-guides-mode)
(add-hook 'rust-mode-hook 'highlight-indent-guides-mode)
(add-hook 'python-mode-hook 'highlight-indent-guides-mode)
(add-hook 'clojure-mode-hook 'highlight-indent-guides-mode)
(add-hook 'tuareg-mode-hook 'highlight-indent-guides-mode)


