;; ==================== Basic Settings ====================

;; Use mirror source, optional tuna/emacs-china/ustc/tencent/melpa
(defconst *mirror-source* 'melpa)

;; set the default font-list and font height, nil to use default
;; the fonts that exist in the system will be select from it.
(defconst *default-font-list* '("IBM Plex Mono Semibold" "Hack" "SF Mono" "Noto Sans Mono"
				"JetBrains Mono" "Fira Code" "Cascadia Code" "Menlo" "Consolas"))

(defconst *default-font-size* 115)

;; configure whether to display certain controls.
(defconst *menu-bar* nil)
(defconst *tool-bar* nil)
(defconst *tab-bar* nil)
(defconst *scroll-bar* nil)

;; backup file directory
(setq backup-directory-alist '(("." . "~/.backups")))

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
