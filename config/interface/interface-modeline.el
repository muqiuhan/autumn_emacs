;; modeline.el --- Modeline configuration -*- lexical-binding: t -*-

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

(if (not *mode-line*)
    (add-hook 'after-init-hook '(lambda () (setq-default mode-line-format nil)))
  (cond
   ((eq *mode-line* 'awesome-tray)
    (progn
      (load "~/.emacs.d/site-lisp/awesome-tray.el")
      (require 'awesome-tray)
      (add-hook 'after-init-hook 'awesome-tray-mode)))

   ((eq *mode-line* 'powerline)
    (progn
      (require-package 'powerline)
      (add-hook 'after-init-hook 'powerline-center-theme)))

   ((eq *mode-line* 'doom-modeline)
    (progn
      (require-package 'doom-modeline)
      (doom-modeline-mode 1)))
   (t
    ())))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; modeline.el ends here
