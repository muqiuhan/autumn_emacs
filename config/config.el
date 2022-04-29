(load "~/.emacs.d/config/package.el")
(load "~/.emacs.d/config/interface/dashboard.el")
(load "~/.emacs.d/config/interface/window.el")
(load "~/.emacs.d/config/interface/editor.el")
(load "~/.emacs.d/config/interface/modeline.el")
(load "~/.emacs.d/config/interface/theme.el")

(load "~/.emacs.d/config/util/treemacs.el")
(load "~/.emacs.d/config/util/window-numbering.el")
(load "~/.emacs.d/config/util/writeroom.el")
(load "~/.emacs.d/config/util/multiple-cursors.el")
(load "~/.emacs.d/config/util/dired-sidebar.el")
(load "~/.emacs.d/config/util/flycheck.el")
(load "~/.emacs.d/config/util/emacs-trans.el")
(load "~/.emacs.d/config/util/company.el")
(load "~/.emacs.d/config/util/awesome-pair.el")
(load "~/.emacs.d/config/util/org.el")
(load "~/.emacs.d/config/util/highlight.el")
(load "~/.emacs.d/config/util/which-key.el")
(load "~/.emacs.d/config/util/dap-mode.el")
(load "~/.emacs.d/config/util/youdao-dictionary.el")
(load "~/.emacs.d/config/util/screenshot.el")

(load "~/.emacs.d/config/develop/ocaml.el")
(load "~/.emacs.d/config/develop/rust.el")

;; ==================== custom Settings ====================

(set-face-attribute 'line-number nil :background "#007")
(set-face-attribute 'line-number-current-line nil :background "#00f")
(set-face-attribute 'region nil :background "#fff" :foreground "#000")

(setq-default cursor-type 'bar)
