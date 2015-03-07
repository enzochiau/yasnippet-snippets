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

(defun parse-parameters (string)
  "Parsing the parameter declaration string.
Return list of (name . value) of parameter."
  (interactive)
  (let (param
        var
        name)
    (dolist (p (split-string string ",\n*" t "\\s-*"))
      (let* ((tmp_param (split-string p "=" t "\\s-*"))
             (param_len  (length tmp_param)))
        (if (> param_len 1)
            (setq val (nth (1- param_len) tmp_param))
          (setq val nil))
        (setq name (cadr (split-string (nth 0 tmp_param) nil t)))
        (add-to-list 'param (cons name val))))
    param))

;; (setq my-str "int P_DATA_WIDTH = 10,
;;                 int P_ADDR_WIDTH = 12,
;;                 int P_NO_VAL,
;;                 int P_DEPTH      = 8")

;; (parse-parameters my-str)
