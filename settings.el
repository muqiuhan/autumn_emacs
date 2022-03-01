;; ==================== Basic Settings ====================

;; set the default font, format: font_name font_size
;; if the font name is empty, use the default font,
;; if the font size is empty, use the default font size,
;; if it is an empty string, nothing will be changed.
(defconst *default-font* "JetBrains Mono 11")

;; configure whether to display certain controls.
(defconst *menu-bar* t)
(defconst *tool-bar* nil)
(defconst *tab-bar* nil)
(defconst *scroll-bar* nil)

;; set the border width of the window (fringe-mode)
;; see: https://www.gnu.org/software/emacs/manual/html_node/emacs/Fringes.html
(defconst *border-width* 0)
