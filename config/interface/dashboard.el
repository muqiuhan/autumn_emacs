(require 'dashboard)

(setq dashboard-startup-banner "~/.emacs.d/logo.png"
      dashboard-init-info (format "Emacs ready in %.2f seconds with %d garbage collections." (float-time (time-subtract after-init-time before-init-time)) gcs-done)
      dashboard-banner-logo-title "The way to have a better tomorrow is to start working on it today."
      dashboard-set-navigator t
      dashboard-center-content t
      dashboard-set-file-icons 'all-the-icons
      dashboard-items '((recents . 20)
			(projects . 10)
			(agenda . 10)))

(set-face-attribute 'dashboard-items-face nil :font (face-attribute 'default :font))

(dashboard-setup-startup-hook)
