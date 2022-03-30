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
