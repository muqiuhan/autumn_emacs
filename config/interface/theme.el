(require 'display-line-numbers)

(defun get-current-hour ()
  (string-to-number (substring (current-time-string) 11 13)))

(if (eq *theme* 'auto)
    (if (> *sunset-time* (get-current-hour))
	(load-theme *day-theme* t)
      (load-theme *night-theme* t))
  (load-theme *theme* t))

(set-face-attribute 'line-number nil :background "#00a" :font (face-attribute 'default :font))
(set-face-attribute 'line-number-current-line nil :background "#00f" :font (face-attribute 'default :font) :foreground "#fff")

(use-package vscode-icon
  :ensure t
  :commands (vscode-icon-for-file))

(when *cursor-type*
  (setq-default cursor-type *cursor-type*))

(when *cursor-color*
  (set-cursor-color *cursor-color*))
