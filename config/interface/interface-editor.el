;; editor.el --- Editor configuration -*- lexical-binding: t -*-

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

(when *line-number*
  (if (version<= "26.0.50" emacs-version)
      (progn
	(add-hook 'prog-mode-hook 'display-line-numbers-mode))
    (progn
      (require 'linum)
      (setq-default linum-format " %d ")
      (add-hook 'prog-mode-hook 'linum-mode))))


(when *hi-line*
  (global-hl-line-mode +1))

(when *smooth-scroll*
  (setq mouse-wheel-scroll-amount '(3 ((shift) . 6) ((control) . nil)))
  (setq mouse-wheel-progressive-speed nil))

(when *beacon*
  (beacon-mode 1))

(when (not (display-graphic-p))
  (xclip-mode))

(provide 'interface-editor)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; editor.el ends here
