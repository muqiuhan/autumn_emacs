;; ==================== Basic Settings ====================

;; Use mirror source, optional tuna/emacs-china/ustc/tencent/melpa
(defconst *mirror-source* 'melpa)

;; Use proxy
(when t
  (setq-default url-proxy-services
		'(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
		  ("http" . "127.0.0.1:7890")
		  ("https" . "127.0.0.1:7890"))))

;; set the default font-list and font height, nil to use default
;; the fonts that exist in the system will be select from it.
(defconst *default-font-list* '("Monego Bold" "SF Mono" "Menlo" "Monaco" "JetBrains Mono" "Fira Code" "Cascadia Code"))

(defconst *default-font-size* 115)

;; Whether to enable font hyphenation effect (provided that the font supports hyphenation)
(defconst *font-ligature* nil)

;; configure whether to display certain controls.
(defconst *menu-bar* nil)
(defconst *tool-bar* nil)
(defconst *sort-tab* t)

;; start window size
(defconst *start-window* 'max)

;; window opacity
(defconst *window-opacity* 95)

;; see : https://www.gnu.org/software/emacs/manual/html_node/emacs/Tab-Bars.html
(defconst *tab-bar* nil)

(defconst *scroll-bar* nil)

;; backup file directory
(setq backup-directory-alist '(("." . "~/.backups")))

;; set the style of modeline, optional values: awesome-tray/doom-modeline/powerline/default/nil,
;; where nil means no modline is displayed
(defconst *mode-line* 'awesome-tray)

;; set the border width of the window (fringe-mode)
;; see: https://www.gnu.org/software/emacs/manual/html_node/emacs/Fringes.html
(defconst *border-width* 0)

;; set the theme, Themes will be automatically selected based on time.
(defconst *day-theme* 'modus-operandi)
(defconst *night-theme* 'modus-vivendi)
(defconst *sunset-time* 19)
(defconst *theme* 'modus-vivendi) ;; if you want auto day/night theme, use 'auto

;; ==================== Editor Settings ====================

;; set the line number, optional values: t/nil
;; t means to display line numbers, vice versa.
;; see : https://www.emacswiki.org/emacs/LineNumbers
(defconst *line-number* t)

;; use gnu-emacs 21 version of hi-line.el to highlighting the current line,
;; t is on, nil is off.
(defconst *hi-line* t)

;; Set smooth scrolling, which will set the number of rows to scroll at a time to 1,
;; and still scroll faster by holding down shift and scrolling
(defconst *smooth-scroll* t)

;; Whether to enable multi-cursor editing
(defconst *multiple-cursors* t)

;; Whether to use Evil
(defconst *evil-mode* t)

;; ==================== Util Settings ====================

;; enable global-company-mode
(defconst *company* t)

;; youdao dictionary
(defconst *youdao-dictionary-key* "C-c y")

;; Translation result display scheme, optional postframe, tootip, popup-tip
(defconst *youdao-dictionary-result-display-scheme* 'postframe)

;; How flycheck is displayed (pos-tip / posframe / popup-tip)
(defconst *flycheck-show-mode* 'posframe)
