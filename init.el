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
    dap-mode
    rainbow-mode
    hl-todo
    major-mode-hydra
    pretty-hydra
    lsp-pyright
    ccls
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
 '(package-selected-packages
   '(clojure-mode youdao-dictionary yasnippet xclip writeroom-mode window-numbering which-key vterm vscode-icon volatile-highlights use-package tuareg treemacs-projectile treemacs-persp treemacs-magit symbol-overlay shrink-path rustic rainbow-mode rainbow-identifiers rainbow-delimiters racket-mode powerline org-superstar ocp-indent ocamlformat ob-fsharp multiple-cursors modern-cpp-font-lock merlin major-mode-hydra lsp-ui lsp-pyright hl-todo highlight-indent-guides flycheck-posframe flycheck-pos-tip flycheck-popup-tip esup dune-format dune doom-themes diff-hl dashboard dap-mode company-prescient company-box ccls beacon all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfrs-border-color ((t (:background "#a8a8a8"))))
 '(diff-hl-change ((t (:foreground nil :background nil))))
 '(diff-hl-delete ((t (:inherit diff-removed :background nil))))
 '(diff-hl-insert ((t (:inherit diff-added :background nil))))
 '(hl-todo ((t (:inherit default :height 0.9 :width condensed :weight bold :underline nil :inverse-video t))))
 '(lsp-headerline-breadcrumb-path-error-face ((t :underline (:style wave :color "#ff8059") :inherit lsp-headerline-breadcrumb-path-face)))
 '(lsp-headerline-breadcrumb-path-hint-face ((t :underline (:style wave :color nil) :inherit lsp-headerline-breadcrumb-path-face)))
 '(lsp-headerline-breadcrumb-path-info-face ((t :underline (:style wave :color nil) :inherit lsp-headerline-breadcrumb-path-face)))
 '(lsp-headerline-breadcrumb-path-warning-face ((t :underline (:style wave :color "#d0bc00") :inherit lsp-headerline-breadcrumb-path-face)))
 '(lsp-headerline-breadcrumb-symbols-error-face ((t :inherit lsp-headerline-breadcrumb-symbols-face :underline (:style wave :color "#ff8059"))))
 '(lsp-headerline-breadcrumb-symbols-hint-face ((t :inherit lsp-headerline-breadcrumb-symbols-face :underline (:style wave :color nil))))
 '(lsp-headerline-breadcrumb-symbols-info-face ((t :inherit lsp-headerline-breadcrumb-symbols-face :underline (:style wave :color nil))))
 '(lsp-headerline-breadcrumb-symbols-warning-face ((t :inherit lsp-headerline-breadcrumb-symbols-face :underline (:style wave :color "#d0bc00"))))
 '(lsp-ui-sideline-code-action ((t (:inherit warning))))
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
