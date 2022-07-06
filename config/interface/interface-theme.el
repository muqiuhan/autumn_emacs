;; theme.el --- Theme configuration -*- lexical-binding: t -*-

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

(require 'display-line-numbers)
(require 'highlight-indent-guides)

(defun get-current-hour ()
  (string-to-number (substring (current-time-string) 11 13)))

(when *theme*
  (if (eq *theme* 'auto)
      (if (> *sunset-time* (get-current-hour))
	  (load-theme *day-theme* t)
	(load-theme *night-theme* t))
    (load-theme *theme* t)))

(when *highcontrast-line-number*
    (set-face-attribute 'line-number nil :background "#00a" :font (face-attribute 'default :font) :foreground "#aaa")
    (set-face-attribute 'line-number-current-line nil :background "#00f" :font (face-attribute 'default :font) :foreground "#fff"))

(when *highcontrast-indent-guides*
    (set-face-attribute 'highlight-indent-guides-character-face 'nil :foreground "#B57614"))

(use-package vscode-icon
  :ensure t
  :commands (vscode-icon-for-file))

(when *cursor-type*
  (setq-default cursor-type *cursor-type*))

(when *cursor-color*
  (set-cursor-color *cursor-color*))

(provide 'interface-theme)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; theme.el ends here
