;; init-racket.el --- Initialize racket configurations.	-*- lexical-binding: t -*-

;; Copyright (C) 2010-2021 MuqiuHan

;; Author: Vincent Zhang <muqiu-han@outlook.com>
;; URL: https://gitee.com/muqiu-han/autumn-emacs

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

;;; Code:

(require 'lsp-mode)

(defcustom lsp-racket-executable-path "racket"
  "Path to Racket executable."
  :group 'lsp-racket
  :type 'string)

(defcustom lsp-racket-server-args '()
  "Extra arguments for the Racket language server."
  :group 'lsp-racket
  :type '(repeat string))

(defun lsp-racket--server-command ()
  "Generate the language server startup command."
  `(,lsp-racket-executable-path "--lib" "racket-langserver" ,@lsp-racket-server-args))

(defvar lsp-racket--config-options `())

(lsp-register-client
 (make-lsp-client :new-connection
   (lsp-stdio-connection 'lsp-racket--server-command)
   :major-modes '(racket-mode)
   :server-id 'racket
   :initialized-fn (lambda (workspace)
                     (with-lsp-workspace workspace
                       (lsp--set-configuration
                        `(:racket ,lsp-racket--config-options))))))

(add-hook 'racket-mode-hook 'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook 'highlight-indent-guides-mode)

(provide 'init-racket)
