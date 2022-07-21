;; config.el --- Used to load configuration files -*- lexical-binding: t -*-

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

(let ((default-directory  "~/.emacs.d/config/"))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "~/.emacs.d/config")

(require 'config-package)

(require 'util-window-numbering)
(require 'util-treemacs)
(require 'util-multiple-cursors)
(require 'util-flycheck)
(require 'util-write)
(require 'util-lsp)
(require 'util-shell)
(require 'util-highlight)
(require 'util-which-key)
(require 'util-youdao-dictionary)
(require 'util-company)

(require 'develop-ocaml)
(require 'develop-rust)
(require 'develop-racket)
(require 'develop-fsharp)

(require 'interface-dashboard)
(require 'interface-editor)
(require 'interface-modeline)
(require 'interface-window)
(require 'interface-theme)

;; ==================== custom Settings ====================

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config.el ends here
