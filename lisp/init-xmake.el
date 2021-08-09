;; init-xmake.el --- Initialize xmake configurations.	-*- lexical-binding: t -*-

;; Copyright (C) 2021

;; Author: Muqiu Han <muqiu-han@outlook.com>
;; URL: https://gitee.com/muqiu-han/emacs-xmake

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
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

;;; Commentary:

;;; Code:

(defun get-xmake.lua-path ()
  (defun generate-parent-path (path)
    (if (= 1 ((lambda (path)
		        (let ((find-pointer 0)
		              (path-separator-number 0))
		          (while (< find-pointer (- (length path) 1))
		            (if (char-equal (nth find-pointer path) ?/)
			            (progn (setq path-separator-number (1+ path-separator-number))
			                   (setq find-pointer (1+ find-pointer)))
		              (setq find-pointer (1+ find-pointer))))
		          path-separator-number))
	          (string-to-list path)))
	    "/"
      (substring path 0 ((lambda (path)
			               (catch 'break
			                 (let ((find-pointer (- (length path) 1)))
			                   (while (> find-pointer 0)
				                 (if (char-equal (nth find-pointer path) ?/)
				                     (throw 'break find-pointer)
				                   (setq find-pointer (1- find-pointer)))))))
			             (string-to-list path)))))

  (let (find-pointer (generate-parent-path (buffer-file-name (current-buffer))))
    (catch 'break
      (while (not (member "xmake.lua" (directory-files (if find-pointer
							                               find-pointer
							                             (throw 'break nil)))))
	    (if (string-equal "/" find-pointer)
	        (setq find-pointer nil)
	      (setq find-pointer (generate-parent-path find-pointer)))))
    (when find-pointer
      (concat find-pointer "/xmake.lua"))))

(defun exec-xmake (command)
  (eshell-command (concat "xmake " command " -F " (get-xmake.lua-path) " ")))

(defun xmake-build ()
  (interactive)
  (exec-xmake "build"))

(defun xmake-run ()
  (interactive)
  (exec-xmake "r"))

(defun xmake-clean ()
  (interactive)
  (exec-xmake "clean"))

(defun xmake-rebuild ()
  (interactive)
  (exec-xmake "--rebuild"))

(provide 'init-xmake)
