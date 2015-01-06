;;; package --- Elisp functions for Verilog Mode Snippets

;;; Commentary:

;;; Code:

(defun get-buffer-name ()
  "Get buffer base name."
  (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))


(defun get-pkg-name (name)
  "Get the package name from string."
  (setq s (substring-no-properties name))
  (string-match "\\(.*\\)_\\(agent\\|env\\|item\|config\\|driver\\|monitor\\|if\\|abstract\\|sequence.?\\|base_sequence\\|seq_lib|\\test_lib\\)\\(_pkg\\|_c\\|\\)" s)
  (match-string 1 s))


(defun get-buffer-prefix ()
  "Get the prefix of buffer name"
  (setq s (substring-no-properties (get-buffer-name)))
  (string-match "\\(.*?\\)" s)
  (match-string 1 s))

