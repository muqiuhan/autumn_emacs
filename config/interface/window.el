;; Font
(if (not (string= *default-font* ""))
    (set-frame-font *default-font*))

;; window
(when (not *menu-bar*)
  (menu-bar-mode 0))

(when (not *tool-bar*)
  (tool-bar-mode 0))

(when (not *tab-bar*)
  (tab-bar-mode 0))

(when (not *scroll-bar*)
  (scroll-bar-mode 0))

(fringe-mode *border-width*)
