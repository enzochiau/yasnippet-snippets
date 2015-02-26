;;; package --- Elisp functions for Verilog Mode Snippets

;;; Commentary:

;;; Code:

(defun get-buffer-name ()
  "Get buffer base name."
  (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))

(defconst pkg-suffix
  (regexp-opt '(
                "item"
                "config"
                "macros"
                "driver"
                "monitor"
                "sequencer"
                "sequence"
                "scoreboard"
                "seq_lib"
                "test_lib"
                "agent"
                "agent_pkg"
                "pkg"
                "abs_if"
                "if"
                "abs_if_pkg") nil))


(defun get-pkg-name (name)
  "Get the package name from string."
  (setq s (substring-no-properties name))
  ;; (string-match "\\(.*?\\)_\\(agent_pkg\\|agent\\|env\\|item\\|config\\|driver\\|monitor\\|scoreboard\\|abs_if\\|abs_if_pkg\\|if\\|abstract\\|sequencer\\|sequence\\|seq_lib\\|test_lib\\|c\\|pkg\\)" s)
  (string-match (concat "\\(.*?\\)_" pkg-suffix) s)
  (match-string 1 s))

;; (get-pkg-name "test_abs_if")
;; (get-pkg-name "test_abs_if_pkg")
;; (get-pkg-name "test_agent_pkg")
;; (get-pkg-name "test_pkg")
