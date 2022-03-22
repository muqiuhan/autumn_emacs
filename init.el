(defconst *base-package-list*
  '(window-numbering
    youdao-dictionary
    dired-sidebar
    vscode-icon
    treemacs
    slime-company
    slime-repl-ansi-color
    hy-mode
    poetry
    python-mode
    slime
    cmake-ide
    cmake-mode
    clang-format
    ocp-indent
    eglot
    all-the-icons
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
 '(custom-safe-themes
   '("1bddd01e6851f5c4336f7d16c56934513d41cc3d0233863760d1798e74809b4b" "0466adb5554ea3055d0353d363832446cd8be7b799c39839f387abb631ea0995" "4b6b6b0a44a40f3586f0f641c25340718c7c626cbf163a78b5a399fbe0226659" "353ffc8e6b53a91ac87b7e86bebc6796877a0b76ddfc15793e4d7880976132ae" "a6e620c9decbea9cac46ea47541b31b3e20804a4646ca6da4cce105ee03e8d0e" "8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "a7b20039f50e839626f8d6aa96df62afebb56a5bbd1192f557cb2efb5fcfb662" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "f7fed1aadf1967523c120c4c82ea48442a51ac65074ba544a5aefc5af490893b" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "f91395598d4cb3e2ae6a2db8527ceb83fed79dbaf007f435de3e91e5bda485fb" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "0b0d189e2393d17e30d5101ba53f6798712a415b26de4f164b3fc878f54a5521" default))
 '(package-selected-packages
   '(dired-sidebar vscode-icon sweet-theme jedi hy-mode slime-company ## clang-format cmake-mode cmake-ide eglot youdao-dictionary lsp-treemacs ocp-indent ocamlformat rustic magit flycheck projectile dune dune-format tuareg lsp-ui geiser geiser-chez geiser-gambit geiser-guile geiser-mit highlight-indent-guides rainbow-delimiters company-prescient use-package yasnippet company-box all-the-icons all-the-icons-ivy-rich)))
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
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
(put 'downcase-region 'disabled nil)
