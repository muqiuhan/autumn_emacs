;; window.el --- Window configuration -*- lexical-binding: t -*-

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

(when (not *menu-bar*)
  (menu-bar-mode 0))

(when (not *tool-bar*)
  (tool-bar-mode 0))

(when (not *tab-bar*)  
  (tab-bar-mode 0))

(when (display-graphic-p)
  (when (not *scroll-bar*)
    (scroll-bar-mode 0))
  
  ;; window
  (defun x11-maximize-frame ()
    "Maximize the current frame (to full screen)"
    (interactive)
    (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
    (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))

  ;; Font
  (cl-loop for font in *default-font-list*
           when ((lambda (font-name)
		   (find-font (font-spec :name font-name))) font)
           return (set-face-attribute 'default nil
                                      :font font
                                      :height *default-font-size*))

  (when *font-ligature*
    (load "~/.emacs.d/site-lisp/ligature.el/ligature.el")
    (use-package ligature
      :load-path "path-to-ligature-repo"
      :config
      ;; Enable the "www" ligature in every possible major mode
      (ligature-set-ligatures 't '("www"))
      ;; Enable traditional ligature support in eww-mode, if the
      ;; `variable-pitch' face supports it
      (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
      ;; Enable all Cascadia Code ligatures in programming modes
      (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
					   ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
					   "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
					   "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
					   "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
					   "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
					   "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
					   "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
					   ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
					   "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
					   "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
					   "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
					   "\\\\" "://"))
      ;; Enables ligature checks globally in all buffers. You can also do it
      ;; per mode with `ligature-mode'.
      (global-ligature-mode t)))

  (set-frame-parameter (selected-frame) 'alpha (list *window-opacity* 50))
  (fringe-mode *border-width*)

  ;; sort-tab
  (when *sort-tab*
    (load "~/.emacs.d/site-lisp/sort-tab/sort-tab.el")
    (require 'sort-tab)
    (sort-tab-mode 1)
    (global-set-key (kbd "C-M-n") 'sort-tab-select-next-tab)
    (global-set-key (kbd "C-M-p") 'sort-tab-select-prev-tab)
    (global-set-key (kbd "C-x x c") 'sort-tab-close-all-tabs)
    (global-set-key (kbd "C-x x x") 'sort-tab-close-current-tab))

  (when *start-window*
    (cond
     ((eq *start-window* 'max)
      (progn
	(when (eq system-type 'gnu/linux)
	  (x11-maximize-frame))
	(when (eq system-type 'windows-nt)
	  (w32-send-sys-command 61488))))
     (t
      ()))))

(setq frame-title-format
      `((buffer-file-name "%f" "%b")
        ,(format " - AutumnEmacs %s" emacs-version)))

(provide 'interface-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window.el ends here
