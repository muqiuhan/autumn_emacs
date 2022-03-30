(require 'treemacs-mode)
(require 'vscode-icon)

(setq-default treemacs-missing-project-action  'remove
	      treemacs-sorting                 'alphabetic-asc
	      treemacs-follow-after-init       t
	      treemacs-position                'left
	      treemacs-width                   40
	      treemacs-no-png-images           nil)

(global-set-key (kbd "C-x t t ") 'treemacs)
(define-key treemacs-mode-map (kbd "M-0") 'treemacs-select-window)
