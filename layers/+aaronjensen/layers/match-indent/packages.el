;;; packages.el --- match-indent layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Aaron Jensen <aaronjensen@aaronmbp.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `match-indent-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `match-indent/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `match-indent/pre-init-PACKAGE' and/or
;;   `match-indent/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst match-indent-packages '(dtrt-indent))

(defun match-indent/init-dtrt-indent ()
  (use-package dtrt-indent
    :init
    (progn
      (add-hook 'prog-mode-hook (lambda () (dtrt-indent-mode 1)))
      (setq dtrt-indent-verbosity 0))))

;;; packages.el ends here
