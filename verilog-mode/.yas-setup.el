;;; package --- Elisp functions for Verilog Mode Snippets

;;; Commentary:

;;; Code:

(defun get-buffer-name ()
  "Get buffer base name."
  (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))


(defun get-pkg-name (full-pkg-name)
  "Get the package name from string."
  (setq s (substring-no-properties full-pkg-name))
  (string-match "\\(.*\\)_\\(agent\\|env\\)_pkg" s)
  (match-string 1 s))

  
