(require 'sql) ;; for sql-keywords
(require 'go-mode) ;; for go-mode-hook
(require 'glsl-mode) ;; for syntax hightlighting


; (nth 0 (nth 4 glsl-font-lock-keywords-1))
;(nth 0 keyword)
(defun match-regexes (end)
  "Search for SQl keywords within Go strings."
  (let (pos (case-fold-search t))
    (while (and (setq pos (re-search-forward (nth 0 val) end t))
                (null (nth 3 (syntax-ppss pos)))))
    (when pos (message "Found pos keyword at %s" pos))
    pos))


;(message (nth 1 (nth 4 glsl-font-lock-keywords-1)))

;(nth 4 glsl-font-lock-keywords-1)
(defun go-add-sql-keyword-matcher ()
  "Hook to add fontification of sql-keywords in strings."
  (mapcar (lambda (keywords)
            (progn
              (defvar val keywords)
              (message (nth 0 val))              
              (font-lock-add-keywords
               nil
               '((match-regexes 0 glsl-keyword-face t))               
               'append)))
          glsl-font-lock-keywords)
  )

(remove-hook 'go-mode-hook 'go-add-sql-keyword-matcher)
(add-hook 'go-mode-hook 'go-add-sql-keyword-matcher)
