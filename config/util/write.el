;; OrgMode:
(require 'org)
(require 'writeroom-mode)

(setq-default writeroom-width (truncate (/ (window-total-width) 1.5)))

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
