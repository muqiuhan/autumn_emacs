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

(defun x11-maximize-frame ()
  "Maximize the current frame (to full screen)"
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))

(when *start-window*
  (cond
   ((eq *start-window* 'max)
    (progn
      (when (eq system-type 'gnu/linux)
	(x11-maximize-frame))
      (when (eq system-type 'windows-nt)
	(w32-send-sys-command 61488))))
   (t
    ())))

(fringe-mode *border-width*)
