;;; package --- Elisp functions for Verilog Mode Snippets

;;; Commentary:

;;; Code:

(defun get-buffer-name ()
  "Get buffer base name."
  (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))


(defun get-pkg-name (name)
  "Get the package name from string."
  (setq s (substring-no-properties name))
  (string-match "\\(.*\\)_\\(agent\\|env\\|item\\|config\\|driver\\|monitor\\|scoreboard\\|if\\|abstract\\|sequence\\|seq_lib\\|test_lib\\|c\\)" s)
  (match-string 1 s))

