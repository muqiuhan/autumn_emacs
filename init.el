;; init.el --- init.el -*- lexical-binding: t -*-

;; Copyright (C) 2019-2022 Muqiu Han

;; Author: Muqiu Han <muqiu-han@outlook.com>
;; URL: https://github.com/muqiuhan/autumn_emacs

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;

;;; Code:

(defconst *base-package-list*
  '(window-numbering
    treemacs-projectile
    symbol-overlay
    rainbow-mode
    hl-todo
    diff-hl
    volatile-highlights
    pulse
    modern-cpp-font-lock
    vterm
    doom-themes
    fsharp-mode
    ob-fsharp
    xclip
    org-superstar
    beacon
    multiple-cursors
    treemacs-magit
    treemacs-persp
    youdao-dictionary
    writeroom-mode
    which-key
    rainbow-identifiers
    flycheck-pos-tip
    flycheck-posframe
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
   '("8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "a6e620c9decbea9cac46ea47541b31b3e20804a4646ca6da4cce105ee03e8d0e" "353ffc8e6b53a91ac87b7e86bebc6796877a0b76ddfc15793e4d7880976132ae" "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "d6844d1e698d76ef048a53cefe713dbbe3af43a1362de81cdd3aefa3711eae0d" "e6f3a4a582ffb5de0471c9b640a5f0212ccf258a987ba421ae2659f1eaa39b09" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "3d47380bf5aa650e7b8e049e7ae54cdada54d0637e7bac39e4cc6afb44e8463b" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "730c0535f3d0edc8119588447af65230d205a7402bf71194a9817d3bf0d6b5ea" "3d54650e34fa27561eb81fc3ceed504970cc553cfd37f46e8a80ec32254a3ec3" default))
 '(package-selected-packages
   '(cmake-mode ob-fsharp doom-themes bongo xclip modern-cpp-font-lock xwwp go-mode youdao-dictionary yasnippet writeroom-mode window-numbering which-key vterm vscode-icon use-package tuareg treemacs-projectile treemacs-persp treemacs-magit telega smart-cursor-color rustic rainbow-delimiters racket-mode org-superstar olivetti ocp-indent ocamlformat multiple-cursors merlin lsp-ui leetcode irony highlight-indent-guides geiser-mit geiser-guile geiser-gambit geiser-chez fsharp-mode flycheck-posframe flycheck-pos-tip flycheck-popup-tip dune-format dune dired-sidebar dashboard dap-mode corfu company-prescient company-box citre beacon all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfrs-border-color ((t (:background "#a8a8a8"))))
 '(diff-hl-change ((t (:foreground "#83a598" :background nil))))
 '(diff-hl-delete ((t (:inherit diff-removed :background nil))))
 '(diff-hl-insert ((t (:inherit diff-added :background nil))))
 '(flycheck-posframe-background-face ((t (:inherit tooltip))))
 '(flycheck-posframe-border-face ((t (:inherit font-lock-comment-face))))
 '(flycheck-posframe-face ((t (:foreground "#44bc44"))))
 '(flycheck-posframe-info-face ((t (:foreground "#44bc44"))))
 '(hl-todo ((t (:inherit default :height 0.9 :width condensed :weight bold :underline nil :inverse-video t))))
 '(org-level-1 ((t (:family "monospace" :height 1.3))))
 '(org-level-2 ((t (:family "monospace" :height 1.2))))
 '(org-level-3 ((t (:family "monospace" :height 1.15))))
 '(org-level-4 ((t (:family "monospace" :height 1.1))))
 '(org-level-5 ((t (:family "monospace"))))
 '(org-level-6 ((t (:family "monospace"))))
 '(org-level-7 ((t (:family "monospace"))))
 '(org-level-8 ((t (:family "monospace"))))
 '(pulse-highlight-face ((t (:inherit region))))
 '(pulse-highlight-start-face ((t (:inherit region))))
 '(symbol-overlay-default-face ((t (:inherit (region bold))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; init.el ends here
