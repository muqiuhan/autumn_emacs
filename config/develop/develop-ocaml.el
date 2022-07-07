;; ocaml.el --- OCaml configuration -*- lexical-binding: t -*-

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

(require 'tuareg)

(defun ocaml-file-has-errors? ()
  (flycheck-list-errors)
  (flycheck-buffer-empty-p (window-buffer (flycheck-get-error-list-window))))

(defun update-opam-env ()
  "eval $(opam env) &&")

(defun dune-build ()
  (interactive)
  (projectile-run-compilation
   (concat (update-opam-env)
	   " cd " (projectile-compilation-dir) " && "
	   "dune build")))

(defun dune-clean ()
  (interactive)
  (projectile-run-compilation
   (concat (update-opam-env)
	   " cd " (projectile-compilation-dir) " && "
	   "dune clean")))

(defun dune-test ()
  (interactive)
  (projectile-run-compilation
   (concat (update-opam-env)
	   " cd " (projectile-compilation-dir) " && "
	   "dune test")))

(define-key tuareg-mode-map (kbd "C-x x b") (lambda () (interactive) (dune-build)))
(define-key tuareg-mode-map (kbd "C-x x t") (lambda () (interactive) (dune-test)))
(define-key tuareg-mode-map (kbd "C-x x c") (lambda () (interactive) (dune-clean)))
(define-key tuareg-mode-map (kbd "C-M-i") (lambda () (interactive) (ocamlformat)))

(provide 'develop-ocaml)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ocaml.el ends here
