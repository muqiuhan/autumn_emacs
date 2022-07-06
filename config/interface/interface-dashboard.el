;; dashboard.el --- Dashboard configuration -*- lexical-binding: t -*-

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

(require 'dashboard)

(setq dashboard-startup-banner "~/.emacs.d/logo.png"
      dashboard-init-info (format "Emacs ready in %.2f seconds with %d garbage collections." (float-time (time-subtract after-init-time before-init-time)) gcs-done)
      dashboard-banner-logo-title "The way to have a better tomorrow is to start working on it today."
      dashboard-set-navigator t
      dashboard-center-content t
      dashboard-set-file-icons 'all-the-icons
      dashboard-items '((recents . 20)
			(projects . 10)
			(agenda . 10)))

(set-face-attribute 'dashboard-items-face nil :font (face-attribute 'default :font))

(dashboard-setup-startup-hook)

(provide 'interface-dashboard)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dashboard.el ends here
