(require 'treemacs-mode)

(setq-default treemacs-missing-project-action  'remove
	      treemacs-sorting                 'alphabetic-asc
	      treemacs-follow-after-init       t
	      treemacs-position                'right
	      treemacs-width                   50
	      treemacs-no-png-images           nil)

(global-set-key (kbd "C-x t t ") 'treemacs)
