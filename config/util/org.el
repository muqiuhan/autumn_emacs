(require 'org)
(require 'olivetti)

(setq-default olivetti-style 'fancy
	      olivetti-minimum-body-width (truncate (/ (window-total-width) 1.5)))

(add-hook 'org-mode-hook 'olivetti-mode)
