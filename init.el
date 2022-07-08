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
