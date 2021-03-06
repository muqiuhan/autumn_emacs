;; init-lsp.el --- Initialize LSP configurations.	-*- lexical-binding: t -*-

;; Copyright (C) 2018-2021 Vincent Zhang

;; Author: Vincent Zhang <seagle0128@gmail.com>
;; URL: https://github.com/seagle0128/.emacs.d

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

;;; Commentary:
;;
;; Language Server Protocol (LSP) configurations.
;;

;;; Code:

(require 'major-mode-hydra)
(require 'org)
(require 'lsp-ui-sideline)

(when (version<= "26.0.50" emacs-version)
  (use-package lsp-mode
    :diminish
    :defines lsp-clients-python-library-directories
    :commands (lsp-enable-which-key-integration
               lsp-format-buffer
               lsp-organize-imports
               lsp-install-server)
    :custom
    ;; what to use when checking on-save. "check" is default, I prefer clippy
    (lsp-rust-analyzer-cargo-watch-command "clippy")
    (lsp-eldoc-render-all t)
    (lsp-idle-delay 0.6)
    ;; enable / disable the hints as you prefer:
    (lsp-rust-analyzer-server-display-inlay-hints t)
    (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
    (lsp-rust-analyzer-display-chaining-hints t)
    (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
    (lsp-rust-analyzer-display-closure-return-type-hints t)
    (lsp-rust-analyzer-display-parameter-hints nil)
    (lsp-rust-analyzer-display-reborrow-hints nil)
    
    :custom-face
    (lsp-headerline-breadcrumb-path-error-face
     ((t :underline (:style wave :color ,(face-foreground 'error))
         :inherit lsp-headerline-breadcrumb-path-face)))
    (lsp-headerline-breadcrumb-path-warning-face
     ((t :underline (:style wave :color ,(face-foreground 'warning))
         :inherit lsp-headerline-breadcrumb-path-face)))
    (lsp-headerline-breadcrumb-path-info-face
     ((t :underline (:style wave :color ,(face-foreground 'success))
         :inherit lsp-headerline-breadcrumb-path-face)))
    (lsp-headerline-breadcrumb-path-hint-face
     ((t :underline (:style wave :color ,(face-foreground 'success))
         :inherit lsp-headerline-breadcrumb-path-face)))

    (lsp-headerline-breadcrumb-symbols-error-face
     ((t :inherit lsp-headerline-breadcrumb-symbols-face
         :underline (:style wave :color ,(face-foreground 'error)))))
    (lsp-headerline-breadcrumb-symbols-warning-face
     ((t :inherit lsp-headerline-breadcrumb-symbols-face
         :underline (:style wave :color ,(face-foreground 'warning)))))
    (lsp-headerline-breadcrumb-symbols-info-face
     ((t :inherit lsp-headerline-breadcrumb-symbols-face
         :underline (:style wave :color ,(face-foreground 'success)))))
    (lsp-headerline-breadcrumb-symbols-hint-face
     ((t :inherit lsp-headerline-breadcrumb-symbols-face
         :underline (:style wave :color ,(face-foreground 'success)))))

    :bind (:map lsp-mode-map
		("C-c C-d" . lsp-describe-thing-at-point)
		([remap xref-find-definitions] . lsp-find-definition)
		([remap xref-find-references] . lsp-find-references))
    :init
    ;; @see https://emacs-lsp.github.io/lsp-mode/page/performance
    (setq read-process-output-max (* 1024 10240)) ;; 1MB

    (setq lsp-keymap-prefix "C-c l"
          lsp-keep-workspace-alive nil
          lsp-signature-auto-activate nil
          lsp-modeline-code-actions-enable nil
          lsp-modeline-diagnostics-enable nil
          lsp-modeline-workspace-status-enable nil
          lsp-headerline-breadcrumb-enable nil

          lsp-enable-file-watchers nil
          lsp-enable-folding nil
          lsp-enable-symbol-highlighting nil
          lsp-enable-text-document-color nil

          lsp-enable-indentation nil
          lsp-enable-on-type-formatting nil)

    ;; For `lsp-clients'
    (setq lsp-clients-python-library-directories '("/usr/local/" "/usr/"))
    :config
    (with-no-warnings
      ;; Disable `lsp-mode' in `git-timemachine-mode'
      (defun my-lsp--init-if-visible (fn &rest args)
        (unless (bound-and-true-p git-timemachine-mode)
          (apply fn args)))
      (advice-add #'lsp--init-if-visible :around #'my-lsp--init-if-visible)

      ;; Enable `lsp-mode' in sh/bash/zsh
      (defun my-lsp-bash-check-sh-shell (&rest _)
        (and (eq major-mode 'sh-mode)
             (memq sh-shell '(sh bash zsh))))
      (advice-add #'lsp-bash-check-sh-shell :override #'my-lsp-bash-check-sh-shell)

      (defun lsp-update-server ()
	"Update LSP server."
	(interactive)
	;; Equals to `C-u M-x lsp-install-server'
	(lsp-install-server t)))

    (use-package lsp-ui
      :custom-face
      (lsp-ui-sideline-code-action ((t (:inherit warning))))
      :pretty-hydra
      ((:title (pretty-hydra-title "LSP UI" 'faicon "rocket" :face 'all-the-icons-green)
               :color amaranth :quit-key "q")
       ("Doc"
	(("d e" (progn
                  (lsp-ui-doc-enable (not lsp-ui-doc-mode))
                  (setq lsp-ui-doc-enable (not lsp-ui-doc-enable)))
          "enable" :toggle lsp-ui-doc-mode)
	 ("d s" (setq lsp-ui-doc-include-signature (not lsp-ui-doc-include-signature))
          "signature" :toggle lsp-ui-doc-include-signature)
	 ("d t" (setq lsp-ui-doc-position 'top)
          "top" :toggle (eq lsp-ui-doc-position 'top))
	 ("d b" (setq lsp-ui-doc-position 'bottom)
          "bottom" :toggle (eq lsp-ui-doc-position 'bottom))
	 ("d p" (setq lsp-ui-doc-position 'at-point)
          "at point" :toggle (eq lsp-ui-doc-position 'at-point))
	 ("d h" (setq lsp-ui-doc-header (not lsp-ui-doc-header))
          "header" :toggle lsp-ui-doc-header)
	 ("d f" (setq lsp-ui-doc-alignment 'frame)
          "align frame" :toggle (eq lsp-ui-doc-alignment 'frame))
	 ("d w" (setq lsp-ui-doc-alignment 'window)
          "align window" :toggle (eq lsp-ui-doc-alignment 'window)))
	"Sideline"
	(("s e" (progn
                  (lsp-ui-sideline-enable (not lsp-ui-sideline-mode))
                  (setq lsp-ui-sideline-enable (not lsp-ui-sideline-enable)))
          "enable" :toggle lsp-ui-sideline-mode)
	 ("s h" (setq lsp-ui-sideline-show-hover (not lsp-ui-sideline-show-hover))
          "hover" :toggle lsp-ui-sideline-show-hover)
	 ("s d" (setq lsp-ui-sideline-show-diagnostics (not lsp-ui-sideline-show-diagnostics))
          "diagnostics" :toggle lsp-ui-sideline-show-diagnostics)
	 ("s s" (setq lsp-ui-sideline-show-symbol (not lsp-ui-sideline-show-symbol))
          "symbol" :toggle lsp-ui-sideline-show-symbol)
	 ("s c" (setq lsp-ui-sideline-show-code-actions (not lsp-ui-sideline-show-code-actions))
          "code actions" :toggle lsp-ui-sideline-show-code-actions)
	 ("s i" (setq lsp-ui-sideline-ignore-duplicate (not lsp-ui-sideline-ignore-duplicate))
          "ignore duplicate" :toggle lsp-ui-sideline-ignore-duplicate))
	"Action"
	(("h" backward-char "???")
	 ("j" next-line "???")
	 ("k" previous-line "???")
	 ("l" forward-char "???")
	 ("C-a" mwim-beginning-of-code-or-line nil)
	 ("C-e" mwim-end-of-code-or-line nil)
	 ("C-b" backward-char nil)
	 ("C-n" next-line nil)
	 ("C-p" previous-line nil)
	 ("C-f" forward-char nil)
	 ("M-b" backward-word nil)
	 ("M-f" forward-word nil)
	 ("c" lsp-ui-sideline-apply-code-actions "apply code actions"))))
      :bind (("C-c u" . lsp-ui-imenu)
             :map lsp-ui-mode-map
             ("M-<f6>" . lsp-ui-hydra/body)
             ("s-<return>" . lsp-ui-sideline-apply-code-actions)
             ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
             ([remap xref-find-references] . lsp-ui-peek-find-references))
      :hook (lsp-mode . lsp-ui-mode)
      :init (setq lsp-ui-sideline-show-diagnostics t
                  lsp-ui-sideline-ignore-duplicate t
                  lsp-ui-doc-delay 0.5
                  lsp-ui-doc-border (face-foreground 'font-lock-comment-face nil t)
                  lsp-ui-imenu-colors `(,(face-foreground 'font-lock-keyword-face)
					,(face-foreground 'font-lock-string-face)
					,(face-foreground 'font-lock-constant-face)
					,(face-foreground 'font-lock-variable-name-face)))
      :config
      (with-no-warnings
	;; Display peek in child frame if possible
	;; @see https://github.com/emacs-lsp/lsp-ui/issues/441
	(defvar lsp-ui-peek--buffer nil)
	(defun lsp-ui-peek--peek-display (fn src1 src2)
          (if (childframe-workable-p)
              (-let* ((win-width (frame-width))
                      (lsp-ui-peek-list-width (/ (frame-width) 2))
                      (string (-some--> (-zip-fill "" src1 src2)
				(--map (lsp-ui-peek--adjust win-width it) it)
				(-map-indexed 'lsp-ui-peek--make-line it)
				(-concat it (lsp-ui-peek--make-footer)))))
		(setq lsp-ui-peek--buffer (get-buffer-create " *lsp-peek--buffer*"))
		(posframe-show lsp-ui-peek--buffer
                               :string (mapconcat 'identity string "")
                               :min-width (frame-width)
                               :internal-border-color (face-foreground 'font-lock-comment-face nil t)
                               :internal-border-width 1
                               :poshandler #'posframe-poshandler-frame-center))
            (funcall fn src1 src2)))
	(defun lsp-ui-peek--peek-destroy (fn)
          (if (childframe-workable-p)
              (progn
		(when (bufferp lsp-ui-peek--buffer)
                  (posframe-hide lsp-ui-peek--buffer))
		(setq lsp-ui-peek--last-xref nil))
            (funcall fn)))
	(advice-add #'lsp-ui-peek--peek-new :around #'lsp-ui-peek--peek-display)
	(advice-add #'lsp-ui-peek--peek-hide :around #'lsp-ui-peek--peek-destroy)

	;; Handle docs
	(defun my-lsp-ui-doc--handle-hr-lines nil
          (let (bolp next before after)
            (goto-char 1)
            (while (setq next (next-single-property-change (or next 1) 'markdown-hr))
              (when (get-text-property next 'markdown-hr)
		(goto-char next)
		(setq bolp (bolp)
                      before (char-before))
		(delete-region (point) (save-excursion (forward-visible-line 1) (point)))
		(setq after (char-after (1+ (point))))
		(insert
		 (concat
                  (and bolp (not (equal before ?\n)) (propertize "\n" 'face '(:height 0.5)))
                  (propertize "\n" 'face '(:height 0.5))
                  (propertize " "
                              ;; :align-to is added with lsp-ui-doc--fix-hr-props
                              'display '(space :height (1))
                              'lsp-ui-doc--replace-hr t
                              'face `(:background ,(face-foreground 'font-lock-comment-face)))
                  ;; :align-to is added here too
                  (propertize " " 'display '(space :height (1)))
                  (and (not (equal after ?\n)) (propertize " \n" 'face '(:height 0.5)))))))))
	(advice-add #'lsp-ui-doc--handle-hr-lines :override #'my-lsp-ui-doc--handle-hr-lines))

      ;; Reset `lsp-ui-doc-background' after loading theme
      (add-hook 'after-load-theme-hook
		(lambda ()
                  (setq lsp-ui-doc-border (face-foreground 'font-lock-comment-face nil t))
                  (set-face-background 'lsp-ui-doc-background (face-background 'tooltip nil t)))))
    ;; Debug
    (when (version<= "26.0.50" emacs-version)
      (use-package dap-mode
	:defines dap-python-executable
	:functions dap-hydra/nil
	:diminish
	:bind (:map lsp-mode-map
                    ("<f5>" . dap-debug)
                    ("M-<f5>" . dap-hydra))
	:hook ((after-init . dap-auto-configure-mode)
               (dap-stopped . (lambda (_args) (dap-hydra)))
               (dap-terminated . (lambda (_args) (dap-hydra/nil)))

               (python-mode . (lambda () (require 'dap-python)))
               (ruby-mode . (lambda () (require 'dap-ruby)))
               (go-mode . (lambda () (require 'dap-go)))
               (java-mode . (lambda () (require 'dap-java)))
               ((c-mode c++-mode objc-mode swift-mode) . (lambda () (require 'dap-lldb)))
               (php-mode . (lambda () (require 'dap-php)))
               (elixir-mode . (lambda () (require 'dap-elixir)))
               ((js-mode js2-mode) . (lambda () (require 'dap-chrome)))
               (powershell-mode . (lambda () (require 'dap-pwsh))))
	:init
	(when (executable-find "python3")
          (setq dap-python-executable "python3"))))
    
      (use-package lsp-treemacs
	:after lsp-mode
	:bind (:map lsp-mode-map
                    ("C-<f8>" . lsp-treemacs-errors-list)
                    ("M-<f8>" . lsp-treemacs-symbols)
                    ("s-<f8>" . lsp-treemacs-java-deps-list))
	:init (lsp-treemacs-sync-mode 1)
	:config
	(with-eval-after-load 'ace-window
          (when (boundp 'aw-ignored-buffers)
            (push 'lsp-treemacs-symbols-mode aw-ignored-buffers)
            (push 'lsp-treemacs-java-deps-mode aw-ignored-buffers)))

	(with-no-warnings
          (when (require 'all-the-icons nil t)
            (treemacs-create-theme "autumn-emacs-colors"
              :extends "doom-colors"
              :config
              (progn
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "repo" :height 1.0 :v-adjust -0.1 :face 'all-the-icons-blue))
		 :extensions (root))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "tag" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-lblue))
		 :extensions (boolean-data))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "settings_input_component" :height 0.95 :v-adjust -0.15 :face 'all-the-icons-orange))
		 :extensions (class))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "palette" :height 0.95 :v-adjust -0.15))
		 :extensions (color-palette))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "square-o" :height 0.95 :v-adjust -0.15))
		 :extensions (constant))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "file-text-o" :height 0.95 :v-adjust -0.05))
		 :extensions (document))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "storage" :height 0.95 :v-adjust -0.15 :face 'all-the-icons-orange))
		 :extensions (enumerator))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "format_align_right" :height 0.95 :v-adjust -0.15 :face 'all-the-icons-lblue))
		 :extensions (enumitem))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "bolt" :height 0.95 :v-adjust -0.05 :face 'all-the-icons-orange))
		 :extensions (event))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "tag" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-lblue))
		 :extensions (field))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "search" :height 0.95 :v-adjust -0.05))
		 :extensions (indexer))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "filter_center_focus" :height 0.95 :v-adjust -0.15))
		 :extensions (intellisense-keyword))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "share" :height 0.95 :v-adjust -0.15 :face 'all-the-icons-lblue))
		 :extensions (interface))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "tag" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-lblue))
		 :extensions (localvariable))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "cube" :height 0.95 :v-adjust -0.05 :face 'all-the-icons-purple))
		 :extensions (method))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "view_module" :height 0.95 :v-adjust -0.15 :face 'all-the-icons-lblue))
		 :extensions (namespace))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "format_list_numbered" :height 0.95 :v-adjust -0.15))
		 :extensions (numeric))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "control_point" :height 0.95 :v-adjust -0.2))
		 :extensions (operator))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "wrench" :height 0.8 :v-adjust -0.05))
		 :extensions (property))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "format_align_center" :height 0.95 :v-adjust -0.15))
		 :extensions (snippet))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "text-width" :height 0.9 :v-adjust -0.05))
		 :extensions (string))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "settings_input_component" :height 0.9 :v-adjust -0.15 :face 'all-the-icons-orange))
		 :extensions (structure))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "format_align_center" :height 0.95 :v-adjust -0.15))
		 :extensions (template))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "chevron-right" :height 0.75 :v-adjust 0.1 :face 'font-lock-doc-face))
		 :extensions (collapsed) :fallback "+")
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "chevron-down" :height 0.75 :v-adjust 0.1 :face 'font-lock-doc-face))
		 :extensions (expanded) :fallback "-")
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "file-binary" :height 0.9  :v-adjust 0.0 :face 'font-lock-doc-face))
		 :extensions (classfile))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'all-the-icons-blue))
		 :extensions (default-folder-opened))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-blue))
		 :extensions (default-folder))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'all-the-icons-green))
		 :extensions (default-root-folder-opened))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-green))
		 :extensions (default-root-folder))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "file-binary" :height 0.9 :v-adjust 0.0 :face 'font-lock-doc-face))
		 :extensions ("class"))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "file-zip" :height 0.9 :v-adjust 0.0 :face 'font-lock-doc-face))
		 :extensions (file-type-jar))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
		 :extensions (folder-open))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'font-lock-doc-face))
		 :extensions (folder))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'all-the-icons-orange))
		 :extensions (folder-type-component-opened))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-orange))
		 :extensions (folder-type-component))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'all-the-icons-green))
		 :extensions (folder-type-library-opened))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-green))
		 :extensions (folder-type-library))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'all-the-icons-pink))
		 :extensions (folder-type-maven-opened))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-pink))
		 :extensions (folder-type-maven))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "folder-open" :height 0.9 :v-adjust -0.05 :face 'font-lock-type-face))
		 :extensions (folder-type-package-opened))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'font-lock-type-face))
		 :extensions (folder-type-package))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "plus" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
		 :extensions (icon-create))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "list" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
		 :extensions (icon-flat))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-material "share" :height 0.95 :v-adjust -0.2 :face 'all-the-icons-lblue))
		 :extensions (icon-hierarchical))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "link" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
		 :extensions (icon-link))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "refresh" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
		 :extensions (icon-refresh))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "chain-broken" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
		 :extensions (icon-unlink))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-alltheicon "java" :height 1.0 :v-adjust 0.0 :face 'all-the-icons-orange))
		 :extensions (jar))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "book" :height 0.95 :v-adjust -0.05 :face 'all-the-icons-green))
		 :extensions (library))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "folder-open" :face 'all-the-icons-lblue))
		 :extensions (packagefolder-open))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "file-directory" :height 0.9 :v-adjust 0.0 :face 'all-the-icons-lblue))
		 :extensions (packagefolder))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-faicon "archive" :height 0.9 :v-adjust -0.05 :face 'font-lock-doc-face))
		 :extensions (package))
		(treemacs-create-icon
		 :icon (format "%s " (all-the-icons-octicon "repo" :height 1.0 :v-adjust -0.1 :face 'all-the-icons-blue))
		 :extensions (java-project))))

            (setq lsp-treemacs-theme "autumn-emacs-colors"))))

    ;; Python: pyright
    (use-package lsp-pyright
      :preface
      ;; Use yapf to format
      (defun lsp-pyright-format-buffer ()
	(interactive)
	(when (and (executable-find "yapf") buffer-file-name)
          (call-process "yapf" nil nil nil "-i" buffer-file-name)))
      :hook (python-mode . (lambda ()
                             (require 'lsp-pyright)
                             (add-hook 'after-save-hook #'lsp-pyright-format-buffer t t)))
      :init (when (executable-find "python3")
              (setq lsp-pyright-python-executable-cmd "python3")))

    ;; C/C++/Objective-C support
    (use-package ccls
      :defines projectile-project-root-files-top-down-recurring
      :hook ((c-mode c++-mode objc-mode cuda-mode) . (lambda () (require 'ccls)))
      :config
      (with-eval-after-load 'projectile
	(setq projectile-project-root-files-top-down-recurring
              (append '("compile_commands.json" ".ccls")
                      projectile-project-root-files-top-down-recurring)))
      (with-no-warnings
	;; FIXME: fail to call ccls.xref
	;; @see https://github.com/emacs-lsp/emacs-ccls/issues/109
	(cl-defmethod my-lsp-execute-command
          ((_server (eql ccls)) (command (eql ccls.xref)) arguments)
          (when-let ((xrefs (lsp--locations-to-xref-items
                             (lsp--send-execute-command (symbol-name command) arguments))))
            (xref--show-xrefs xrefs nil)))
	(advice-add #'lsp-execute-command :override #'my-lsp-execute-command)))))

(provide 'util-lsp)
