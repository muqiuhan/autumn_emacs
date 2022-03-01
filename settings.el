;; ==================== Basic Settings ====================

;; Use mirror source, optional tuna/emacs-china/ustc/tencent/melpa
(defconst *mirror-source* 'melpa)

;; set the default font and font height, nil to use default
(defconst *default-font* "IBM Plex Mono Medium")
(defconst *default-font-size* 120)

;; configure whether to display certain controls.
(defconst *menu-bar* nil)
(defconst *tool-bar* nil)
(defconst *tab-bar* nil)
(defconst *scroll-bar* nil)

;; set the style of modeline, optional values: awesome-tray/doom-modeline/powerline-default/nil,
;; where nil means no modline is displayed
(defconst *mode-line* 'powerline)

;; set the border width of the window (fringe-mode)
;; see: https://www.gnu.org/software/emacs/manual/html_node/emacs/Fringes.html
(defconst *border-width* 0)

;; set the theme, nil means use the default theme
(defconst *theme* 'doom-dracula)

;; ==================== Editor Settings ====================

;; set the line number, optional values: t/nil
;; t means to display line numbers, vice versa.
;; see : https://www.emacswiki.org/emacs/LineNumbers
(defconst *line-number* t)

;; use gnu-emacs 21 version of hi-line.el to highlighting the current line,
;; t is on, nil is off.
(defconst *hi-line* t)

;; ==================== Util Settings ====================

;; enable global-company-mode
(defconst *company* t)
