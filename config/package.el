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
