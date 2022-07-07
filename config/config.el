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


(load-file "~/.emacs.d/config/config-package.el")

(load-file "~/.emacs.d/config/interface/interface-window.el")
(load-file "~/.emacs.d/config/interface/interface-editor.el")
(load-file "~/.emacs.d/config/interface/interface-modeline.el")
(load-file "~/.emacs.d/config/interface/interface-dashboard.el")
(load-file "~/.emacs.d/config/interface/interface-theme.el")

(load-file "~/.emacs.d/config/util/util-window-numbering.el")
(load-file "~/.emacs.d/config/util/util-treemacs.el")
(load-file "~/.emacs.d/config/util/util-multiple-cursors.el")
(load-file "~/.emacs.d/config/util/util-flycheck.el")
(load-file "~/.emacs.d/config/util/util-write.el")

(load-file "~/.emacs.d/config/util/util-which-key.el")
(load-file "~/.emacs.d/config/util/util-youdao-dictionary.el")
(load-file "~/.emacs.d/config/util/util-company.el")

(load-file "~/.emacs.d/config/develop/develop-ocaml.el")
(load-file "~/.emacs.d/config/develop/develop-rust.el")
(load-file "~/.emacs.d/config/develop/develop-racket.el")
(load-file "~/.emacs.d/config/develop/develop-fsharp.el")

;; ==================== custom Settings ====================

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config.el ends here
