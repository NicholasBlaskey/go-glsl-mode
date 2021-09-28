(require 'sql) ;; for sql-keywords
(require 'go-mode) ;; for go-mode-hook

; https://emacs.stackexchange.com/questions/10165/can-i-add-highlighting-in-a-minor-mode
(defvar go-sql-keywords (concat "\\<" (mapconcat 'car sql-mode-ansi-font-lock-keywords "\\|") "\\>")
  "SQL keywords for go-mode stolen from `sql-mode-ansi-font-lock-keywords'.")

(defun go-sql-keyword-matcher (end)
  "Search for SQl keywords within Go strings."
  (let (pos (case-fold-search t))
    (while (and (setq pos (re-search-forward go-sql-keywords end t))
                (null (nth 3 (syntax-ppss pos)))))
    (when pos (message "Found pos keyword at %s" pos))
    pos))

(defface go-sql-keyword-face
  '((((class grayscale))  :slant nil :inherit font-lock-string-face)
    (((class color)) :slant italic :inherit font-lock-string-face)
    (t :slant nil :inherit font-lock-string-face))
  "Face to highlight SQL keywords within go strings."
  :group 'go-sql)

(defcustom go-sql-keyword-face 'go-sql-keyword-face
  "Face to highlight SQL keywords within go strings."
  :type 'face
  :group 'go-sql)

(defun go-add-sql-keyword-matcher ()
  "Hook to add fontification of sql-keywords in strings."
  (font-lock-add-keywords
   nil
   '((go-sql-keyword-matcher 0 go-sql-keyword-face t))
   'append))

(add-hook 'go-mode-hook 'go-add-sql-keyword-matcher)
