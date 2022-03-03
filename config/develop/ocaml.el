(require 'tuareg)
(require 'projectile)
(require 'flycheck)

(defun ocaml-file-has-errors? ()
  (flycheck-list-errors)
  (flycheck-buffer-empty-p (window-buffer (flycheck-get-error-list-window))))

(defun ocaml-save-file ()
  (interactive)
  (projectile-run-compilation
   (concat "eval $(opam env) && " ;; update opam environment
	   "cd " (projectile-compilation-dir) " && " ;; cd project root directory
	   "dune build"))
  (save-buffer))

(add-hook 'tuareg-mode-hook 'lsp)
(add-hook 'tuareg-mode-hook 'projectile-mode)
(add-hook 'tuareg-mode-hook 'flycheck-mode)

(define-key tuareg-mode-map (kbd "C-x C-s") #'ocaml-save-file)
