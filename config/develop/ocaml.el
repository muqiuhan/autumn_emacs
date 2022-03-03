(require 'tuareg)
(require 'projectile)
(require 'flycheck)
(require 'ocp-indent)

(defun ocaml-file-has-errors? ()
  (flycheck-list-errors)
  (flycheck-buffer-empty-p (window-buffer (flycheck-get-error-list-window))))

(defun update-opam-env ()
  "eval $(opam env) &&")

(defun dune-build ()
  (interactive)
  (projectile-run-compilation
   (concat (update-opam-env)
	   "cd " (projectile-compilation-dir) " && "
	   "dune build")))

(defun dune-clean ()
  (interactive)
  (projectile-run-compilation
   (concat (update-opam-env)
	   "cd " (projectile-compilation-dir) " && "
	   "dune clean")))

(defun dune-test ()
  (interactive)
  (projectile-run-compilation
   (concat (update-opam-env)
	   "cd " (projectile-compilation-dir) " && "
	   "dune test")))

(add-hook 'tuareg-mode-hook 'lsp)
(add-hook 'tuareg-mode-hook 'projectile-mode)
(add-hook 'tuareg-mode-hook 'flycheck-mode)

(define-key tuareg-mode-map (kbd "C-x x b") 'dune-build)
(define-key tuareg-mode-map (kbd "C-x x t") 'dune-test)
(define-key tuareg-mode-map (kbd "C-x x c") 'dune-clean)
