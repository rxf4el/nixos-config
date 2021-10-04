;;; Package: --- init.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Byte Compile
(eval-when-compile (require 'cl-lib nil t))
(setq auto-save-list-file-prefix nil
      byte-compile-warnings '(not cl-functions obsolete))

;; add paths to the list
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

;; load config file
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(provide 'init)
;; init.el ends here.
