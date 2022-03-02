(when *line-number*
  (if (version<= "26.0.50" emacs-version)
      (progn
	(add-hook 'c-mode-hook 'display-line-numbers-mode)
	(add-hook 'emacs-lisp-mode-hook 'display-line-numbers-mode)
	(add-hook 'c++-mode-hook 'display-line-numbers-mode)
	(add-hook 'tuareg-mode-hook 'display-line-numbers-mode)
	(add-hook 'python-mode-hook 'display-line-numbers-mode)
	(add-hook 'clojure-mode-hook 'display-line-numbers-mode)
	(add-hook 'racket-mode-hook 'display-line-numbers-mode))
    (progn
      (require 'linum)
      (setq-default linum-format " %d ")
      (add-hook 'c-mode-hook 'linum-mode)
      (add-hook 'emacs-lisp-mode-hook 'linum-mode)
      (add-hook 'c++-mode-hook 'linum-mode)
      (add-hook 'tuareg-mode-hook 'linum-mode)
      (add-hook 'python-mode-hook 'linum-mode)
      (add-hook 'clojure-mode-hook 'linum-mode)
      (add-hook 'racket-mode-hook 'linum-mode))))

(when *hi-line*
  (global-hl-line-mode +1))