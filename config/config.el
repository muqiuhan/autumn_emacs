(require 'cl-lib)

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

;; Develop Settings
(load "~/.emacs.d/config/develop/scheme.el")
