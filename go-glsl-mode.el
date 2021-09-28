(require 'sql) ;; for sql-keywords
(require 'go-mode) ;; for go-mode-hook
(require 'glsl-mode) ;; for syntax hightlighting

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
  '((((class color) (min-colors 88) (background light))
     :background "darkseagreen2")
    (((class color) (min-colors 88) (background dark))
     :background "darkolivegreen")
    (((class color) (min-colors 16) (background light))
     :background "darkseagreen2")
    (((class color) (min-colors 16) (background dark))
    :background "darkolivegreen")
    (((class color) (min-colors 8))
     :background "green" :foreground "black")
    (t :inverse-video t))
  "Basic face for highlighting."
  :group 'basic-faces)


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

(remove-hook 'go-mode-hook 'go-add-sql-keyword-matcher)
(add-hook 'go-mode-hook 'go-add-sql-keyword-matcher)

;(define-minor-mode blah-mode
;  (font-lock-add-keywords
;   nil
;   '((go-sql-keyword-matcher 0 go-sql-keyword-face t))
;   'append))
  
