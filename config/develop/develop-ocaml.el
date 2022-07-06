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
(require 'projectile)
(require 'flycheck)
(require 'ocp-indent)
(require 'ocamlformat)
(require 'merlin)

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

;; ## added by OPAM user-setup for emacs / base ## cfd3c9b7837c85cffd0c59de521990f0 ## you can edit, but keep this line
(provide 'opam-user-setup)

;; Base configuration for OPAM

(defun opam-shell-command-to-string (command)
  "Similar to shell-command-to-string, but returns nil unless the process
  returned 0, and ignores stderr (shell-command-to-string ignores return value)"
  (let* ((return-value 0)
         (return-string
          (with-output-to-string
            (setq return-value
                  (with-current-buffer standard-output
                    (process-file shell-file-name nil '(t nil) nil
                                  shell-command-switch command))))))
    (if (= return-value 0) return-string nil)))

(defun opam-update-env (switch)
  "Update the environment to follow current OPAM switch configuration"
  (interactive
   (list
    (let ((default
            (car (split-string (opam-shell-command-to-string "opam switch show --safe")))))
      (completing-read
       (concat "opam switch (" default "): ")
       (split-string (opam-shell-command-to-string "opam switch list -s --safe") "\n")
       nil t nil nil default))))
  (let* ((switch-arg (if (= 0 (length switch)) "" (concat "--switch " switch)))
         (command (concat "opam config env --safe --sexp " switch-arg))
         (env (opam-shell-command-to-string command)))
    (when (and env (not (string= env "")))
      (dolist (var (car (read-from-string env)))
        (setenv (car var) (cadr var))
        (when (string= (car var) "PATH")
          (setq exec-path (split-string (cadr var) path-separator)))))))

(opam-update-env nil)

(defvar opam-share
  (let ((reply (opam-shell-command-to-string "opam config var share --safe")))
    (when reply (substring reply 0 -1))))

(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; OPAM-installed tools automated detection and initialisation

(defun opam-setup-tuareg ()
  (add-to-list 'load-path (concat opam-share "/tuareg") t)
  (load "tuareg-site-file"))

(defun opam-setup-add-ocaml-hook (h)
  (add-hook 'tuareg-mode-hook h t)
  (add-hook 'caml-mode-hook h t))

(defun opam-setup-complete ()
  (if (require 'company nil t)
    (opam-setup-add-ocaml-hook
      (lambda ()
         (company-mode)
         (defalias 'auto-complete 'company-complete)))
    (require 'auto-complete nil t)))

(defun opam-setup-ocp-indent ()
  (opam-setup-complete)
  (autoload 'ocp-setup-indent "ocp-indent" "Improved indentation for Tuareg mode")
  (autoload 'ocp-indent-caml-mode-setup "ocp-indent" "Improved indentation for Caml mode")
  (add-hook 'tuareg-mode-hook 'ocp-setup-indent t)
  (add-hook 'caml-mode-hook 'ocp-indent-caml-mode-setup  t))

(defun opam-setup-ocp-index ()
  (autoload 'ocp-index-mode "ocp-index" "OCaml code browsing, documentation and completion based on build artefacts")
  (opam-setup-add-ocaml-hook 'ocp-index-mode))

(defun opam-setup-merlin ()
  (opam-setup-complete)
  (require 'merlin)
  (opam-setup-add-ocaml-hook 'merlin-mode)

  (defcustom ocp-index-use-auto-complete nil
    "Use auto-complete with ocp-index (disabled by default by opam-user-setup because merlin is in use)"
    :group 'ocp_index)
  (defcustom merlin-ac-setup 'easy
    "Use auto-complete with merlin (enabled by default by opam-user-setup)"
    :group 'merlin-ac)

  ;; So you can do it on a mac, where `C-<up>` and `C-<down>` are used
  ;; by spaces.
  (define-key merlin-mode-map
    (kbd "C-c <up>") 'merlin-type-enclosing-go-up)
  (define-key merlin-mode-map
    (kbd "C-c <down>") 'merlin-type-enclosing-go-down)
  (set-face-background 'merlin-type-face "skyblue"))

(defun opam-setup-utop ()
  (autoload 'utop "utop" "Toplevel for OCaml" t)
  (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
  (add-hook 'tuareg-mode-hook 'utop-minor-mode))

(defvar opam-tools
  '(("tuareg" . opam-setup-tuareg)
    ("ocp-indent" . opam-setup-ocp-indent)
    ("ocp-index" . opam-setup-ocp-index)
    ("merlin" . opam-setup-merlin)
    ("utop" . opam-setup-utop)))

(defun opam-detect-installed-tools ()
  (let*
      ((command "opam list --installed --short --safe --color=never")
       (names (mapcar 'car opam-tools))
       (command-string (mapconcat 'identity (cons command names) " "))
       (reply (opam-shell-command-to-string command-string)))
    (when reply (split-string reply))))

(defvar opam-tools-installed (opam-detect-installed-tools))

(defun opam-auto-tools-setup ()
  (interactive)
  (dolist (tool opam-tools)
    (when (member (car tool) opam-tools-installed)
     (funcall (symbol-function (cdr tool))))))

(opam-auto-tools-setup)
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
;; ## added by OPAM user-setup for emacs / tuareg ## c654e70703ac7d9d1c58324519eb6f42 ## you can edit, but keep this line
;; Set to autoload tuareg from its original switch when not found in current
;; switch (don't load tuareg-site-file as it adds unwanted load-paths)
(defun opam-tuareg-autoload (fct file doc args)
  (let ((load-path (cons "~/.opam/4.14.0/share/emacs/site-lisp" load-path)))
    (load file))
  (apply fct args))
(when (not (member "tuareg" opam-tools-installed))
  (defun tuareg-mode (&rest args)
    (opam-tuareg-autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code" args))
  (defun tuareg-run-ocaml (&rest args)
    (opam-tuareg-autoload 'tuareg-run-ocaml "tuareg" "Run an OCaml toplevel process" args))
  (defun ocamldebug (&rest args)
    (opam-tuareg-autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger" args))
  (defalias 'run-ocaml 'tuareg-run-ocaml)
  (defalias 'camldebug 'ocamldebug)
  (add-to-list 'auto-mode-alist '("\\.ml[iylp]?\\'" . tuareg-mode))
  (add-to-list 'auto-mode-alist '("\\.eliomi?\\'" . tuareg-mode))
  (add-to-list 'interpreter-mode-alist '("ocamlrun" . tuareg-mode))
  (add-to-list 'interpreter-mode-alist '("ocaml" . tuareg-mode))
  (dolist (ext '(".cmo" ".cmx" ".cma" ".cmxa" ".cmxs" ".cmt" ".cmti" ".cmi" ".annot"))
    (add-to-list 'completion-ignored-extensions ext)))
;; ## end of OPAM user-setup addition for emacs / tuareg ## keep this line
;; ## added by OPAM user-setup for emacs / ocp-indent ## 5a8784f26ff561e114c1fa09f967a8c7 ## you can edit, but keep this line
;; Load ocp-indent from its original switch when not found in current switch
(when (not (assoc "ocp-indent" opam-tools-installed))
  (autoload 'ocp-setup-indent "~/.opam/4.14.0/share/emacs/site-lisp/ocp-indent.el" "Improved indentation for Tuareg mode")
  (autoload 'ocp-indent-caml-mode-setup "~/.opam/4.14.0/share/emacs/site-lisp/ocp-indent.el" "Improved indentation for Caml mode")
  (add-hook 'tuareg-mode-hook 'ocp-setup-indent t)
  (add-hook 'caml-mode-hook 'ocp-indent-caml-mode-setup  t)
  (setq ocp-indent-path "~/.opam/4.14.0/bin/ocp-indent"))
;; ## end of OPAM user-setup addition for emacs / ocp-indent ## keep this line

(provide 'develop-ocaml)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ocaml.el ends here
