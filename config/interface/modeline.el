(if (not *mode-line*)
    (setq-default mode-line-format nil)
  (cond
   ((eq *mode-line* 'awesome-tray)
    (progn
      (require 'awesome-tray)
      (setq-default awesome-tray-buffer-name-max-length 50
		    awesome-tray-file-name-max-length 50
		    awesome-tray-refresh-idle-delay 0)
      (add-hook 'after-init-hook 'awesome-tray-mode)))

   ((eq *mode-line* 'powerline)
    (progn
      (require-package 'powerline)
      (powerline-default-theme)))

   ((eq *mode-line* 'doom-modeline)
    (progn
      (require-package 'doom-modeline)
      (doom-modeline-mode 1)))
   (t
    ())))
