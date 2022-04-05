(require 'clang-format)
(require 'cmake-mode)
(require 'irony)
(require 'cmake-ide)
(require 'cc-mode)

(add-hook 'cmake-mode-hook 'cmake-ide-run-cmake)
(add-hook 'c++-mode-hook 'lsp)

(define-key c++-mode-map (kbd "C-S-i") 'clang-format-buffer)

(when *cpp-irony*
  (use-package irony
    :config
    (progn
      ;; If irony server was never installed, install it.
      (unless (irony--find-server-executable) (call-interactively #'irony-install-server))

      (add-hook 'c++-mode-hook 'irony-mode)
      (add-hook 'c-mode-hook 'irony-mode)

      ;; Use compilation database first, clang_complete as fallback.
      (setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
                                                      irony-cdb-clang-complete))

      (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
      ))

  ;; I use irony with company to get code completion.
  (use-package company-irony
    :config
    (progn
      (eval-after-load 'company '(add-to-list 'company-backends 'company-irony))))

  ;; Eldoc shows argument list of the function you are currently writing in the echo area.
  (use-package irony-eldoc
    :config
    (progn
      (add-hook 'irony-mode-hook #'irony-eldoc))))
