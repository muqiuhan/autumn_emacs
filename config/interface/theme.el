(require 'display-line-numbers)

(defun get-current-hour ()
  (string-to-number (substring (current-time-string) 11 13)))

(if (eq *theme* 'auto)
    (if (> *sunset-time* (get-current-hour))
	(load-theme *day-theme* t)
      (load-theme *night-theme* t))
  (load-theme *theme* t))

(use-package vscode-icon
  :ensure t
  :commands (vscode-icon-for-file))

(set-face-attribute 'line-number-current-line nil :background "#0000ff" :font (face-attribute 'default :font))
(set-face-attribute 'line-number nil :background "#0000aa" :font (face-attribute 'default :font))
(set-face-attribute 'default nil :background "#111111")

(set-cursor-color "#00ff00")
