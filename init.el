(defconst *base-package-list*
  '(window-numbering
    treemacs
    ocp-indent
    lsp-treemacs
    company
    ocamlformat
    magit
    rustic
    flycheck
    lsp-mode
    lsp-ui
    projectile
    highlight-indent-guides
    rainbow-delimiters
    geiser
    geiser-chez 
    geiser-gambit
    geiser-guile
    geiser-mit 
    company-prescient
    yasnippet
    company-box
    use-package
    tuareg
    dune
    dune-format
    dashboard
    doom-themes))

(load "~/.emacs.d/settings.el")
(load "~/.emacs.d/config/config.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-treemacs ocp-indent ocamlformat rustic magit flycheck projectile dune dune-format tuareg lsp-ui geiser geiser-chez geiser-gambit geiser-guile geiser-mit highlight-indent-guides rainbow-delimiters company-prescient use-package yasnippet company-box all-the-icons all-the-icons-ivy-rich)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-headerline-breadcrumb-path-error-face ((t :underline (:style wave :color "#ff5555") :inherit lsp-headerline-breadcrumb-path-face)))
 '(lsp-headerline-breadcrumb-path-hint-face ((t :underline (:style wave :color "#50fa7b") :inherit lsp-headerline-breadcrumb-path-face)))
 '(lsp-headerline-breadcrumb-path-info-face ((t :underline (:style wave :color "#50fa7b") :inherit lsp-headerline-breadcrumb-path-face)))
 '(lsp-headerline-breadcrumb-path-warning-face ((t :underline (:style wave :color "#f1fa8c") :inherit lsp-headerline-breadcrumb-path-face)))
 '(lsp-headerline-breadcrumb-symbols-error-face ((t :inherit lsp-headerline-breadcrumb-symbols-face :underline (:style wave :color "#ff5555"))))
 '(lsp-headerline-breadcrumb-symbols-hint-face ((t :inherit lsp-headerline-breadcrumb-symbols-face :underline (:style wave :color "#50fa7b"))))
 '(lsp-headerline-breadcrumb-symbols-info-face ((t :inherit lsp-headerline-breadcrumb-symbols-face :underline (:style wave :color "#50fa7b"))))
 '(lsp-headerline-breadcrumb-symbols-warning-face ((t :inherit lsp-headerline-breadcrumb-symbols-face :underline (:style wave :color "#f1fa8c")))))
