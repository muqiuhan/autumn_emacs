(load "~/.emacs.d/site-lisp/emacs-comment-trans.el/comment-translate.el")

(setq-default translate-shell-path "/usr/bin/trans"
              target-language "en"
              source-language "zh"
              comment-translate-selected-color "red")

(global-set-key (kbd "C-S-t") 'translate-select-string)
