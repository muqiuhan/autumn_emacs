(if (not *mode-line*)
    (add-hook 'after-init-hook '(lambda () (setq-default mode-line-format nil)))
  (cond
   ((eq *mode-line* 'awesome-tray)
    (progn
      (load "~/.emacs.d/site-lisp/awesome-tray.el")
      (require 'awesome-tray)
      (add-hook 'after-init-hook 'awesome-tray-mode)))

   ((eq *mode-line* 'powerline)
    (progn
      (require-package 'powerline)
      (add-hook 'after-init-hook 'powerline-center-theme)))

   ((eq *mode-line* 'doom-modeline)
    (progn
      (require-package 'doom-modeline)
      (doom-modeline-mode 1)))
   (t
    ())))
