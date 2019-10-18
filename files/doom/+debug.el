;;; ~/.doom.d/+debug.el -*- lexical-binding: t; -*-

;; A collection of debugging functions

(defun print-major-mode ()
  "Print current major mode"
  (interactive)
  (message "%s" major-mode))

(defun lookup-definition ()
  "Debug"
  (interactive)
  (message "%s" +lookup-definition-functions))
