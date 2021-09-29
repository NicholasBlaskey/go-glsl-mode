(require 'sql) ;; for sql-keywords
(require 'go-mode) ;; for go-mode-hook
(require 'glsl-mode) ;; for syntax hightlighting

(defun match-regexes (end)
  "Search for SQl keywords within Go strings."
  (let (pos (case-fold-search t))
    (while (and (setq pos (re-search-forward (nth 0 (nth 0 glsl-font-lock-keywords-1)) end t))
                (null (nth 3 (syntax-ppss pos)))))
    (when pos (message "Found pos keyword at %s" pos))
    pos))


(defun go-add-sql-keyword-matcher ()
  "Hook to add fontification of sql-keywords in strings."
  (font-lock-add-keywords
   nil
   '((match-regexes 0 glsl-type-face t))
   'append))

(remove-hook 'go-mode-hook 'go-add-sql-keyword-matcher)
(add-hook 'go-mode-hook 'go-add-sql-keyword-matcher)
