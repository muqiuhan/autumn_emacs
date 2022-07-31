;; write.el --- Markdown and Org-mode configuration -*- lexical-binding: t -*-

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

;; OrgMode:
(require 'org)
(require 'writeroom-mode)

(setq-default writeroom-width 156)

(setq org-ellipsis " ⤵")

(use-package org-superstar
        :if (and (display-graphic-p) (char-displayable-p ?◉))
        :hook (org-mode . org-superstar-mode)
        :init (setq org-superstar-headline-bullets-list '("◉""○""◈""◇""⁕")))

(custom-set-faces
 '(org-level-1 ((t (:family "monospace" :height 1.3))))
 '(org-level-2 ((t (:family "monospace" :height 1.2))))
 '(org-level-3 ((t (:family "monospace" :height 1.15))))
 '(org-level-4 ((t (:family "monospace" :height 1.1))))
 '(org-level-5 ((t (:family "monospace"))))
 '(org-level-6 ((t (:family "monospace"))))
 '(org-level-7 ((t (:family "monospace"))))
 '(org-level-8 ((t (:family "monospace")))))

(add-hook 'org-mode-hook 'writeroom-mode)

;; Markdown
(add-hook 'markdown-mode-hook 'writeroom-mode)

(provide 'util-write)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; write.el ends here
