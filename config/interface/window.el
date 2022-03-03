;; Font
(cl-loop for font in *default-font-list*
         when ((lambda (font-name)
		 (find-font (font-spec :name font-name))) font)
         return (set-face-attribute 'default nil
                                    :font font
                                    :height *default-font-size*))

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
