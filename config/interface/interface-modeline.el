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

(defun codefalling//simplify-major-mode-name ()
  "Return simplifyed major mode name"
  (let* ((major-name (format-mode-line "%m"))
         (replace-table '(Emacs-Lisp "𝝀"
				     Spacemacs\ buffer "𝓢"
				     Python "𝝅"
				     Shell ">"
				     Makrdown "𝓜"
				     GFM "𝓜"
				     Org "𝒪"
				     Text "𝓣"
				     Fundamental "ℱ"
				     ))
         (replace-name (plist-get replace-table (intern major-name))))
    (if replace-name replace-name major-name)))

(if (not *mode-line*)
    (add-hook 'after-init-hook #'(lambda () (setq-default mode-line-format nil)))
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
   
   ((eq *mode-line* 'default)
    (add-hook 'after-init-hook
	      #'(lambda ()
		  (interactive)
		  (setq-default mode-line-format
				(list
				 ;; the buffer name; the file name as a tool tip
				 " "
				 '(:eval (propertize "%b " 'face 'font-lock-keyword-face
						     'help-echo (buffer-file-name)))

				 ;; line and column
				 "(" ;; '%02' to set to 2 chars at least; prevents flickering
				 (propertize "%02l" 'face 'font-lock-type-face) ","
				 (propertize "%02c" 'face 'font-lock-type-face)
				 ") "

				 ;; relative position, size of file
				 "["
				 (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
				 "/"
				 (propertize "%I" 'face 'font-lock-constant-face) ;; size
				 "] "

				 ;; the current major mode for the buffer.
				 "["

				 '(:eval (propertize (codefalling//simplify-major-mode-name) 'face 'font-lock-string-face
						     'help-echo buffer-file-coding-system))
				 "] "


				 "[" ;; insert vs overwrite mode, input-method in a tooltip
				 '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
						     'face 'font-lock-preprocessor-face
						     'help-echo (concat "Buffer is in "
									(if overwrite-mode "overwrite" "insert") " mode")))

				 ;; was this buffer modified since the last save?
				 '(:eval (when (buffer-modified-p)
					   (concat ","  (propertize "Mod"
								    'face 'font-lock-warning-face
								    'help-echo "Buffer has been modified"))))

				 ;; is this buffer read-only?
				 '(:eval (when buffer-read-only
					   (concat ","  (propertize "RO"
								    'face 'font-lock-type-face
								    'help-echo "Buffer is read-only"))))
				 "] "

				 ;; evil state
				 '(:eval (evil-generate-mode-line-tag evil-state))

				 " "
				 ;; add the time, with the date and the emacs uptime in the tooltip
				 '(:eval (propertize (format-time-string "%H:%M")
						     'help-echo
						     (concat (format-time-string "%c; ")
							     (emacs-uptime "Uptime:%hh")))))))))
   (t
    ())))

(provide 'interface-modeline)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; interface-modeline.el ends here
