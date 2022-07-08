;; multiple-cursors.el --- Mutiple-cursors configuration -*- lexical-binding: t -*-

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

(when *multiple-cursors*

  ;; Multiple cursors
  (use-package multiple-cursors
    :bind (("C-S-c C-S-c"   . mc/edit-lines)
           ("C->"           . mc/mark-next-like-this)
           ("C-<"           . mc/mark-previous-like-this)
           ("C-c C-<"       . mc/mark-all-like-this)
           ("C-M->"         . mc/skip-to-next-like-this)
           ("C-M-<"         . mc/skip-to-previous-like-this)
           ("s-<mouse-1>"   . mc/add-cursor-on-click)
           ("C-S-<mouse-1>" . mc/add-cursor-on-click)
           :map mc/keymap
           ("C-|" . mc/vertical-align-with-space))))

(provide 'util-multiple-cursors)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mutiple-cursors.el ends here
