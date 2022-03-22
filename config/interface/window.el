;; Font
(cl-loop for font in *default-font-list*
         when ((lambda (font-name)
		 (find-font (font-spec :name font-name))) font)
         return (set-face-attribute 'default nil
                                    :font font
                                    :height *default-font-size*))


(when *font-ligature*
  (load "~/.emacs.d/site-lisp/ligature.el/ligature.el")
  (use-package ligature
    :load-path "path-to-ligature-repo"
    :config
    ;; Enable the "www" ligature in every possible major mode
    (ligature-set-ligatures 't '("www"))
    ;; Enable traditional ligature support in eww-mode, if the
    ;; `variable-pitch' face supports it
    (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
    ;; Enable all Cascadia Code ligatures in programming modes
    (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
					 ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
					 "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
					 "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
					 "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
					 "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
					 "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
					 "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
					 ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
					 "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
					 "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
					 "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
					 "\\\\" "://"))
    ;; Enables ligature checks globally in all buffers. You can also do it
    ;; per mode with `ligature-mode'.
    (global-ligature-mode t)))

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
