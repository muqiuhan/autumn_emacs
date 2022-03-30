(defconst *base-package-list*
  '(window-numbering
    youdao-dictionary
    irony
    company-irony
    flycheck-irony
    irony-eldoc
    flycheck-pos-tip
    flycheck-posframe
    flycheck-popup-tip
    dired-sidebar
    vscode-icon
    treemacs
    slime-company
    slime-repl-ansi-color
    racket-mode
    geiser-racket
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
   '("da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d548ac4bb4c8c0ba8f22476f5afcea11b7f1754065eefb118e1324f8a74883fb" "5642b25b6df4d6b63787cbc3d3ef07ca4cb7b0a7a00740ce8e9867c00e57632f" "cba5ebfabc6456e4bbd68e0394d176161e1db063c6ca24c23b9828af0bdd7411" "13880fa28757754bc40c85b05689c801ddaa877f2fe65abf1779f37776281ef1" default))
 '(package-selected-packages
   '(irony-eldoc irony geiser-racket racket-mode yaml-mode yaml org-page olivetti telega multiple-cursors hl-todo youdao-dictionary yasnippet window-numbering which-key vscode-icon use-package tuareg sweet-theme slime-repl-ansi-color slime-company rustic rainbow-delimiters python-mode projectile poetry ocp-indent ocamlformat magit lsp-ui lsp-treemacs jedi hy-mode highlight-indent-guides geiser-mit geiser-guile geiser-gambit geiser-chez flycheck-posframe flycheck-pos-tip flycheck-popup-tip eglot dune-format dune doom-themes dired-sidebar dashboard company-prescient company-box cmake-mode cmake-ide clang-format all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
