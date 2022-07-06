;; develop-cpp.el --- C++ configuration -*- lexical-binding: t -*-

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

(use-package cc-mode
  :ensure nil
  :bind (:map c-mode-base-map
              ("C-c c" . compile))
  :hook (c-mode-common . (lambda ()
			   (c-set-offset 'defun-open 2)
			   (c-set-offset 'class-open 2)
			   (c-set-offset 'defun-block-intro 0)
			   (c-set-offset 'class-close 2)
			   (c-set-offset 'topmost-intro 0)))
  :init
  (setq-default c-basic-offset 2)
  
  (use-package modern-cpp-font-lock
    :diminish
    :init (modern-c++-font-lock-global-mode t)))

(provide 'develop-cpp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; develop-cpp.el ends here
