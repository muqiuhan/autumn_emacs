(defconst *base-package-list*
  '(writeroom-mode
    window-numbering
    treemacs-projectile
    corfu
    citre
    telega
    dap-mode
    multiple-cursors
    treemacs-magit
    treemacs-persp
    youdao-dictionary
    irony
    olivetti
    which-key
    rainbow-identifiers
    flycheck-pos-tip
    flycheck-posframe
    doom-themes
    flycheck-popup-tip
    treemacs
    racket-mode
    ocp-indent
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
    merlin
    dune-format
    dashboard))

(load "~/.emacs.d/settings.el")
(load "~/.emacs.d/config/config.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4eb6fa2ee436e943b168a0cd8eab11afc0752aebb5d974bba2b2ddc8910fca8f" "6bdcff29f32f85a2d99f48377d6bfa362768e86189656f63adbf715ac5c1340b" "78c4238956c3000f977300c8a079a3a8a8d4d9fee2e68bad91123b58a4aa8588" "4eb69f17b4fa0cd74f4ff497bb6075d939e8d8bf4321ce8b81d13974000baac1" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "6c98bc9f39e8f8fd6da5b9c74a624cbb3782b4be8abae8fd84cbc43053d7c175" "8d7b028e7b7843ae00498f68fad28f3c6258eda0650fe7e17bfb017d51d0e2a2" "d6844d1e698d76ef048a53cefe713dbbe3af43a1362de81cdd3aefa3711eae0d" "8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "4c35b2323b96197ac9e78763217020f5fd4e9723bb729315582366d2ff040190" "8feca8afd3492985094597385f6a36d1f62298d289827aaa0d8a62fe6889b33c" "1d78d6d05d98ad5b95205670fe6022d15dabf8d131fe087752cc55df03d88595" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d548ac4bb4c8c0ba8f22476f5afcea11b7f1754065eefb118e1324f8a74883fb" "5642b25b6df4d6b63787cbc3d3ef07ca4cb7b0a7a00740ce8e9867c00e57632f" "cba5ebfabc6456e4bbd68e0394d176161e1db063c6ca24c23b9828af0bdd7411" "13880fa28757754bc40c85b05689c801ddaa877f2fe65abf1779f37776281ef1" default))
 '(package-selected-packages
   '(corfu doom-themes julia-repl google-translate emmet-mode dap-mode vterm treemacs-persp treemacs-magit treemacs-projectile darkroom writeroom-mode powerline doom-modeline github-dark-vscode-theme github-modern-theme cider evil irony-eldoc irony geiser-racket racket-mode yaml-mode yaml org-page olivetti telega multiple-cursors hl-todo youdao-dictionary yasnippet window-numbering which-key vscode-icon use-package tuareg sweet-theme slime-repl-ansi-color slime-company rustic rainbow-delimiters python-mode projectile poetry ocp-indent ocamlformat magit lsp-ui lsp-treemacs jedi hy-mode highlight-indent-guides geiser-mit geiser-guile geiser-gambit geiser-chez flycheck-posframe flycheck-pos-tip flycheck-popup-tip eglot dune-format dune dired-sidebar dashboard company-prescient company-box cmake-mode cmake-ide clang-format all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfrs-border-color ((t (:background "#505050"))))
 '(flycheck-posframe-background-face ((t (:inherit tooltip))))
 '(flycheck-posframe-border-face ((t (:inherit font-lock-comment-face))))
 '(flycheck-posframe-face ((t (:foreground "#005e00"))))
 '(flycheck-posframe-info-face ((t (:foreground "#005e00")))))
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
(put 'upcase-region 'disabled nil)
