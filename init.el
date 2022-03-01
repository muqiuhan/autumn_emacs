(defconst *base-package-list*
  '(window-numbering
    treemacs
    company
    dashboard
    doom-themes
    nyan-mode))

(load "~/.emacs.d/settings.el")
(load "~/.emacs.d/config/config.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(clojure-mode racket-mode rust-mode sml-mode tuareg use-package doom-themes nyan-mode company treemacs window-numbering)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
