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



(defun test-match-regexes ()
  (message (nth 0 val))
  )

;(message (nth 1 (nth 4 glsl-font-lock-keywords-1)))

(nth 4 glsl-font-lock-keywords-1)
(defun go-add-sql-keyword-matcher ()
 "Hook to add fontification of sql-keywords in strings."
 (mapcar (lambda (keywords)
           (progn
             (setq val keywords)
             (test-match-regexes)
             (font-lock-add-keywords
              nil
              '((match-regexes 0 val t))
              'append)))
         glsl-font-lock-keywords)
 )

;; (defun go-add-sql-keyword-matcher ()
;;   "Hook to add fontification of sql-keywords in strings."
;;   (progn
;;     (font-lock-add-keywords
;;      nil
;;      '((match-regexes2 0 (nth 4 glsl-font-lock-keywords-1) t))
;;      'append)
;;     (font-lock-add-keywords
;;      nil
;;      '((match-regexes3 0 (nth 1 glsl-font-lock-keywords-1) t))
;;      'append)
;;     )
;;   )
;; (defun match-regexes2 (end)
;;   "Search for SQl keywords within Go strings."
;;   (let (pos (case-fold-search t))
;;     (while (and (setq pos (re-search-forward (nth 0 (nth 4 glsl-font-lock-keywords-1)) end t))
;;                 (null (nth 3 (syntax-ppss pos)))))
;;     (when pos (message "Found pos keyword at %s" pos))
;;     pos))

;; (defun match-regexes3 (end)
;;   "Search for SQl keywords within Go strings."
;;   (let (pos (case-fold-search t))
;;     (while (and (setq pos (re-search-forward (nth 0 (nth 1 glsl-font-lock-keywords-1)) end t))
;;                 (null (nth 3 (syntax-ppss pos)))))
;;     (when pos (message "Found pos keyword at %s" pos))
;;     pos))



(remove-hook 'go-mode-hook 'go-add-sql-keyword-matcher)
(add-hook 'go-mode-hook 'go-add-sql-keyword-matcher)
