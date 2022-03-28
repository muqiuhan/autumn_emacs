(require 'youdao-dictionary)

(global-set-key
 (kbd *youdao-dictionary-key*)
 '(lambda ()
    (interactive)
    (if (display-graphic-p)
      (cond
       ((eq *youdao-dictionary-result-display-scheme* 'tooltip)
	(youdao-dictionary-search-at-point-tooltip))
       ((eq *youdao-dictionary-result-display-scheme* 'postframe)
	(youdao-dictionary-search-at-point-posframe))
       ((eq *youdao-dictionary-result-display-scheme* 'popup-tip)
	(youdao-dictionary-search-at-point+)))
      (youdao-dictionary-search-at-point+))))
