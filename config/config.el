(defun childframe-workable-p ()
  "Test whether childframe is workable."
  (and (version<= "26.0.50" emacs-version)
       (not (or noninteractive
                emacs-basic-display
                (not (display-graphic-p))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-funcs.el ends here

;; Basic settings
(load "~/.emacs.d/config/package.el")
(load "~/.emacs.d/config/interface/dashboard.el")

;; Interface settings
(load "~/.emacs.d/config/interface/window.el")
(load "~/.emacs.d/config/interface/editor.el")
(load "~/.emacs.d/config/interface/modeline.el")
(load "~/.emacs.d/config/interface/theme.el")

;; Util Settings
(load "~/.emacs.d/config/util/window-numbering.el")
(load "~/.emacs.d/config/util/treemacs.el")
(load "~/.emacs.d/config/util/company.el")
(load "~/.emacs.d/config/util/highlight.el")
