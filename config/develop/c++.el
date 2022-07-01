(use-package cc-mode
  :ensure nil
  :bind (:map c-mode-base-map
              ("C-c c" . compile))
  :hook (c-mode-common . (lambda ()
			   (c-set-offset 'defun-open 2)
			   (c-set-offset 'class-open 2)
			   (c-set-offset 'defun-block-intro 0)
			   (c-set-offset 'class-close 2)
			   (c-set-offset 'topmost-intro 0)))
  :init
  (setq-default c-basic-offset 2)
  
  (use-package modern-cpp-font-lock
    :diminish
    :init (modern-c++-font-lock-global-mode t)))
