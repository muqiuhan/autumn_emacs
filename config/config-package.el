;; config-package.el --- Manage global plug-in packages -*- lexical-binding: t -*-

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

(require 'package)

(cond
 ((eq *mirror-source* 'ustc)
  (setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                           ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                           ("melpa-stable" . "http://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                           ("org" . "http://mirrors.ustc.edu.cn/elpa/org/"))))
 
 ((eq *mirror-source* 'tencent)
  (setq package-archives '(("gnu"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
                           ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/"))))

 ((eq *mirror-source* 'tuna)
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                           ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))
 (t
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                           ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))))

(package-initialize)

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
	(if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
          (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install optional package `%s': %S" package err)
     nil)))

(defun install-basic-package ()
  (defun install (package-list)
    (cond
     ((null package-list) '())
     (t (progn (require-package (car package-list))
	       (install (cdr package-list))))))
  (install *base-package-list*))

(install-basic-package)

(add-to-list 'load-path "~/.emacs.d/site-lisp/")


;;; Time-stamp: <2006-12-01 20:13:12 jcgs>

;;  This program is free software; you can redistribute it and/or modify it
;;  under the terms of the GNU General Public License as published by the
;;  Free Software Foundation; either version 2 of the License, or (at your
;;  option) any later version.

;;  This program is distributed in the hope that it will be useful, but
;;  WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;  General Public License for more details.

;;  You should have received a copy of the GNU General Public License along
;;  with this program; if not, write to the Free Software Foundation, Inc.,
;;  59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

(provide 'load-directory)

(defvar load-directory-loaded nil
  "The files loaded by load-directory.")

(defvar load-directory-bytes 0
  "The number of bytes loaded by load-directory.")

(defvar load-directory-pattern
      "\\.\\(elc?\\)\\|\\(ELC?\\)$"
  "Pattern for which files to load when loading all elisp in a directory.
Unfortunately, directory-files insists on treating its pattern
case-sensitively, case-fold-search notwithstanding.")

(setq load-directory-pattern "\\.elc?$")

(defvar load-directory-pre-load-file-hooks nil
  "Functions to be called on each filename loaded by load-directory, just before loading that file.")

(defvar load-directory-post-load-file-hooks nil
  "Functions to be called on each filename loaded by load-directory, just after loading that file.")

(defvar load-directory-file-conses nil
  ;; message "while loading %s, there were %d new conses, %d new symbols, %d more string chars"
  "How much storage was allocated by each file loaded.")

(defun load-directory (dir &optional lisp-only)
  "Load all the el or elc files in DIR.
If the optional second argument is not given, or is nil:
if there are both an elc and an el file for the same base name, load only
the elc file.
If the optional second argument is non-nil, load only .el files."
  (interactive "DDirectory to load emacs files from: 
P")
  (if (or t (yes-or-no-p (format "Load directory %s? " dir)))
      (let ((files (directory-files (expand-file-name (substitute-in-file-name dir)) t
				    load-directory-pattern))
	    (load-compiled (not lisp-only))
	    (gc-before (garbage-collect))
	    gc-after)
	(message "load-directory: files are %s" files)
	(let ((stack-trace-on-error t))
	  (while files
	    (let ((file (car files)))
	      (if (or (and load-compiled
			   (string-match "c$" file))
		      ;; don't load <name>.el if <name>.elc exists
		      (not (file-exists-p (concat file "c"))))
		  (if (or t (y-or-n-p (format "Load file %s? " file)))
		      (progn
			(condition-case error-var
			    (progn
			      (message "Loading %s..." file)
			      (message "(load-file \"%s\")" file)
			      (run-hook-with-args 'load-directory-pre-load-file-hooks file)
			      (if (or t (y-or-n-p (format "load %s? " file)))
				  (load-file file))
			      (setq gc-after (garbage-collect)
				    load-directory-file-conses (cons
								(list file
								      (- (car (car gc-after))
									 (car (car gc-before)))
								      (- (car (car (cdr gc-after)))
									 (car (car (cdr gc-before))))
								      (- (nth 4 gc-after) (nth 4 gc-before)))
								load-directory-file-conses)
				    gc-before gc-after)
			      (if (eq system-type 'berkely-unix)
				  (message "PS: %s" (shell-command-to-string (format "ps  -vp %d" (emacs-pid)))))
			      (run-hook-with-args 'load-directory-post-load-file-hooks file)
			      (message "Loading %s... done" file))
			  (error
			   (progn
			     ;; unfortunately, handling it here means we don't get a backtrace!
			     (if (get-buffer "*Backtrace*")
				 (progn
				   (set-buffer  "*Backtrace*")
				   (rename-buffer (format  "*Backtrace-%s*" file) t)))
			     (if (eq (car error-var) 'file-error)
				 (message "load-path is %S" load-path))
			     (message "Problem in loading %s: %s" file error-var)
			     (sit-for 2))))
			(setq load-directory-loaded (cons file load-directory-loaded)
			      load-directory-bytes (+ load-directory-bytes
						      (nth 7 (file-attributes file))))))))
	    (setq files (cdr files)))))
    (message "Skipped loading directory %s at user request" dir)))

;;; useful auxiliary function for the above
(defun find-subdirectory-from-path (subdir)
  "Return a full pathname for SUBDIR as a subdirectory of something on load-path"
  (interactive "sFind subdir from path: ")
  (catch 'found
    (let ((lp load-path))
      (while lp
	(let* ((fulldir (expand-file-name (car lp)))
	       (fullsubdir (expand-file-name subdir fulldir)))
	  (if (file-directory-p fullsubdir)
	      (throw 'found fullsubdir)))
	(setq lp (cdr lp))))
    nil))

(defconst sys/win32p
  (eq system-type 'windows-nt)
  "Are we running on a WinTel system?")

(defconst sys/linuxp
  (eq system-type 'gnu/linux)
  "Are we running on a GNU/Linux system?")

(defconst sys/macp
  (eq system-type 'darwin)
  "Are we running on a Mac system?")

(defconst sys/mac-x-p
  (and (display-graphic-p) sys/macp)
  "Are we running under X on a Mac system?")

(defconst sys/mac-ns-p
  (eq window-system 'ns)
  "Are we running on a GNUstep or Macintosh Cocoa display?")

(defconst sys/mac-cocoa-p
  (featurep 'cocoa)
  "Are we running with Cocoa on a Mac system?")

(defconst sys/mac-port-p
  (eq window-system 'mac)
  "Are we running a macport build on a Mac system?")

(defconst sys/linux-x-p
  (and (display-graphic-p) sys/linuxp)
  "Are we running under X on a GNU/Linux system?")

(defconst sys/cygwinp
  (eq system-type 'cygwin)
  "Are we running on a Cygwin system?")

(defconst sys/rootp
  (string-equal "root" (getenv "USER"))
  "Are you using ROOT user?")

(defconst emacs/>=27p
  (>= emacs-major-version 27)
  "Emacs is 27 or above.")

(defconst emacs/>=28p
  (>= emacs-major-version 28)
  "Emacs is 28 or above.")

(defconst emacs/>=29p
  (>= emacs-major-version 29)
  "Emacs is 29 or above.")

(defun childframe-workable-p ()
  "Whether childframe is workable."
  (or (not (or noninteractive
               emacs-basic-display
               (not (display-graphic-p))))
      (daemonp)))

(provide 'config-package)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config-package.el ends here
