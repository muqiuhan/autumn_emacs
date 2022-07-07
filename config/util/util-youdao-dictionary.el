;; youdao-dictionary.el --- Youdao-dictionary configuration -*- lexical-binding: t -*-

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

(require 'youdao-dictionary)

(global-set-key
 (kbd *youdao-dictionary-key*)
 #'(lambda ()
    (interactive)
    (if (display-graphic-p)
      (cond
       ((eq *youdao-dictionary-result-display-scheme* 'tooltip)
	(youdao-dictionary-search-at-point-tooltip))
       ((eq *youdao-dictionary-result-display-scheme* 'postframe)
	(youdao-dictionary-search-at-point-posframe))
       ((eq *youdao-dictionary-result-display-scheme* 'popup-tip)
	(youdao-dictionary-search-at-point+)))
      (youdao-dictionary-search-at-point+))))

(provide 'util-youdao-dictionary)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; youdao-dictionary.el ends here
