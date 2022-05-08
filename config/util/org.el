(require 'org)
(require 'olivetti)

(setq-default olivetti-style 'fancy
	      olivetti-minimum-body-width (truncate (/ (window-total-width) 1.5)))

(cl-loop for font in *org-mode-font-list*
         when ((lambda (font-name)
		 (find-font (font-spec :name font-name))) font)
         return
	 (set-face-attribute 'org-block nil :family font :height *org-mode-font-size*))

(add-hook 'org-mode-hook 'olivetti-mode)
