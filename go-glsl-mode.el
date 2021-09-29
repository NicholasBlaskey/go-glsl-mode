(require 'sql) ;; for sql-keywords
(require 'go-mode) ;; for go-mode-hook
(require 'glsl-mode) ;; for syntax hightlighting


;(message glsl-font-lock-keywords-1)

; https://emacs.stackexchange.com/questions/10165/can-i-add-highlighting-in-a-minor-mode
;(defvar go-sql-keywords (concat "\\<" (mapconcat 'car glsl-font-lock-keywords "\\|") "\\>")
;  "SQL keywords for go-mode stolen from ` glsl-type-list'.")

;(message go-sql-keywords)
;(message "My list is %s" (list glsl-type-list)) 
;(message "My list is %s" sql-mode-ansi-font-lock-keywords)


(defun go-sql-keyword-matcher (end)
  "Search for SQl keywords within Go strings."
  (let (pos (case-fold-search t))
    (while (and (setq pos (re-search-forward go-sql-keywords end t))
                (null (nth 3 (syntax-ppss pos)))))
    (when pos (message "Found pos keyword at %s" pos))
    pos))


;(defun go-sql-keyword-matcher (end, keywords)
;  "Search for SQl keywords within Go strings."
;  (let (pos (case-fold-search t))
;    (while (and (setq pos (re-search-forward keywords end t))
;                (null (nth 3 (syntax-ppss pos)))))
;    (when pos (message "Found pos keyword at %s" pos))
;    pos))


(defcustom go-sql-keyword-face 'go-sql-keyword-face
  "Face to highlight SQL keywords within go strings."
  :type 'face
  :group 'go-sql)

(defun go-add-sql-keyword-matcher ()
  "Hook to add fontification of sql-keywords in strings."
  (font-lock-add-keywords
   nil
   '((go-sql-keyword-matcher 0 glsl-type-face t))
   'append))

;(defun add-single-highlighter (val)
;  (message (nth 0 val)))
;  (font-lock-add-keywords
;   nil
;   '((go-sql-keyword-matcher 0 (nth 1 val) (nth 0 val) t))
;   'append))

(defun add-highlighter ()
  (mapcar 'add-single-highlighter glsl-font-lock-keywords-1)
  )
  
;(mapcar 'message2 glsl-font-lock-keywords-1)
  
(remove-hook 'go-mode-hook 'go-add-sql-keyword-matcher)
(add-hook 'go-mode-hook 'go-add-sql-keyword-matcher)

;(remove-hook 'go-mode-hook 'add-highlighter)
;(add-hook 'go-mode-hook 'add-highlighter)



;(remove-hook 'go-mode-hook 'test)
;(add-hook 'go-mode-hook 'test)


;(define-minor-mode blah-mode
;  (font-lock-add-keywords
;   nil
;   '((go-sql-keyword-matcher 0 go-sql-keyword-face t))
;   'append))
  
