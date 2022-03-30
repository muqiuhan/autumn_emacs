;; emacs-comment-trans.el --- emacs-comment-trans.	-*- lexical-binding: t -*-

;; Copyright (C) 2006-2021 Muqiu Han

;; Author: MuqiuHan <muqiu-han@outlook.com>
;; URL: https://github.com/muqiuhan/emacs-comment-trans.el

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

;;; Commentary:
;;
;; Define constants.
;;

;;; Code:

(require 'cl-lib)

(defvar target-language nil
  "The target target language.")

(defvar source-language nil
  "The target source language.")

(defvar translate-shell-path "/usr/bin/trans"
  "The translate-shell exec path.")

(defvar comment-translate-selected-color "red"
  "Selected text color.")

(defvar default-translate-languages '(("zh" "en")
                                      ("en" "zh"))
  "Translate source-language to target-language list by default.")

;; TODO: build-translate-shell : ->
(defun build-translate-shell ()
  "@brief Try to build translate-shell automatically."

  (defconst build-step-list '("git clone https://github.com/soimort/translate-shell ~/.emacs.d/site-lisp/translate-shell --depth=1"
                              "make --directory=~/.emacs.d/site-lisp/translate-shell"))

  (message "build-translate-shell is temporarily unavailable!"))

;; set-selected-region-style : region-begin region-end ->
(defun set-selected-region-style (begin end)
  (put-text-property begin end 'font-lock-face (list :foreground comment-translate-selected-color)))

;; remove-selected-region-style : region-begin region-end ->
(defun remove-selected-region-style (begin end)
  ;; Due to the process-do-you-mean function, directly using remove-text-properties is invalid.
  ;; (remove-text-properties begin end '(font-lock-faces nil))

  ;; Rewrite the text of the selection
  (let ((text (buffer-substring-no-properties (region-beginning) (region-end))))
    (kill-region begin end)
    (insert text)))

;; call-translate-app : str -> str
(defun call-translate-app (command-string)
  "@brief Call the command-string through an external program and return two values.
    which are the return value of the translation program and the return code of the translation program.
   @parameters command-string The command that needs to be called."
  (if (file-exists-p translate-shell-path)
      (shell-command-to-string command-string)
    (progn
      (message (format "[comment-translate]: Translation failed! translate-shell-path not exists."))
      (if (yes-or-no-p "Try to build translate-shell automatically?")
          (build-translate-shell)
        nil))))

;; determine-text-language : str -> list
(defun determine-text-language (select-str)
  "@brief Determine what language select-str is.
   @parameters select-str String, usually the text content of the selection.
   @return Return a list, the first item is source-language, the second item is target-language."

  (let ((str-list (string-to-list select-str))
        (chinese-number 0)
        (english-number 0))

    (while str-list
      (let ((current-char (car str-list)))
        (cond ((and (>= current-char #x4E00) (<= current-char #x9FA5)) (setq chinese-number (1+ chinese-number)))
              ((and (>= current-char #x61) (<= current-char #x7a)) (setq english-number (1+ english-number)))
              (t nil)))
      (setq str-list (cdr str-list)))

    (let ((max-language-number (apply 'max (list chinese-number english-number))))
      (cond ((= max-language-number chinese-number) "zh")
            ((= max-language-number english-number) "en")
            (t "unknow")))))

;; get-default-target-language : str -> str
(defun get-default-target-language (source-lang)
  "@brief Find the target-language corresponding to source-language in default-translate-languages.
   @parameters source-lang source-language
   @return target-language"

  (let ((language-list (copy-list default-translate-languages))
        (target-language "unknow"))

    (while language-list
      (when (string= source-lang (car (car language-list)))
        (setq target-language (car (cdr (car language-list)))))
      (setq language-list (cdr language-list)))

    (message (concat "[comment-translate]: target-language is nil，Automatically select target-language: " target-language))

    target-language))

;; filter-did-you-mean : str -> list
(defun filter-did-you-mean (translated-string)
  "@brief Sometimes the translation result will appear'Did you mean...' which causes unnecessary trouble. This function is used to separate them.
   @parameters translated-string Strings that have been translated but have impurities.
   @return Return a list, the first item is'did you mean...', the second item is the translation result."

  ;; Determine whether it contains'did you mean...'
  (if (string-match "Did you mean:" translated-string)
      ;; Get the first line of string, which is the number of lines where'Did you mean...' is located
      (let ((first-line-end (string-match "\n" translated-string)))
        (list (substring translated-string 0 first-line-end)
              (substring translated-string (+ first-line-end 1)  (length translated-string))))
    (list nil translated-string)))

;; process-did-you-mean : list -> boolean
(defun process-did-you-mean (filter-did-you-mean-result)
  "@brief Dealing with the situation of'did you mean...'
   @parameters filter-did-you-mean-result The return value of the function filter-did-you-mean.
   @see filter-did-you-mean
   @return Ask if you need to process it (y/n), y returns true, n returns false."

  (let ((did-you-mean-string (car filter-did-you-mean-result)))
    (if did-you-mean-string
        (yes-or-no-p did-you-mean-string)
      nil)))

;; get-translate-result-listnn : str -> string
(defun get-translate-result (region-string)
  "@brief Get translation result.
   @parameters region-string Text content of the selected block."
  (let ((filter-string (call-translate-app (concat translate-shell-path " -b :"
                                                   (if target-language
                                                       target-language
                                                     (get-default-target-language (determine-text-language region-string)))
                                                   " \"" region-string "\""))))
    (if filter-string
        ;; Under no circumstances need to take the last character, because it is always a newline character.
        (filter-did-you-mean (substring filter-string 0 (- (length filter-string) 1)))
      nil)))

;; comment-translate-exec-done : ->
(defun comment-translate-exec-done ()
  "@brief call this function to do the cleaning work."

  (when (bufferp "*Shell Command Output*")
    (kill-buffer "*Shell Command Output*"))

  (message "Done"))

;; translate-select-string : ->
(defun translate-select-string ()
  "Translate and replace the text in the selected block."

  (interactive)
  (message (concat "[comment-translate]: " source-language " -> " target-language))
  (let* ((region-begin-position (region-beginning))
         (region-end-position (region-end))
         (region-string (funcall (lambda ()
                                   (when mark-active
                                     (let ((selection (buffer-substring-no-properties (region-beginning) (region-end))))
                                       (unless (= 0 (length selection))
                                         selection)))))))

    (set-selected-region-style region-begin-position region-end-position)
    (if (= 0 (length region-string))
        (message "empty select string.")
      ;; processing translation result.
      (let* ((translate-result (get-translate-result region-string))
             (translate-result-string (nth 1 translate-result))
             (translate-did-you-mean (nth 0 translate-result))
             (replace-result (lambda ()
                               (kill-region (region-beginning) (region-end))
                               (insert translate-result-string)
                               (comment-translate-exec-done))))

        (if (= 0 (length translate-result-string))
            (progn
              (message "[comment-translate]: translate-result-string empty!")
              (remove-selected-region-style region-begin-position region-end-position))

          (if translate-did-you-mean
              (if (process-did-you-mean translate-result)
                  (funcall replace-result)
                (remove-selected-region-style region-begin-position region-end-position))

            (progn
              (funcall replace-result))))))))

(provide 'comment-translate)
