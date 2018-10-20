(defmacro rgx-opt (&rest lis)
  `(regexp-opt (quote ,lis)))

;; test:
;; (rgx-opt "aaa" "bbb" "ccc")

(defun rgx-nested-groups-help (lis)
  (if lis
      (concat (car lis)
              "\\("
              (rx-groups-help (cdr lis))
              "\\)")
    '()))
(defmacro rgx-nested-groups (&rest lis)
  `(rgx-nested-groups-help (quote ,lis)))
;; test:
;; (rgx-nested-groups "aaa" "bbb" "ccc")
;; (rx (groups "aaa"
;;            (groups "bbb"
;;                   (groups "ccc"))))

(defun rgx-groups (&rest lis)
  (apply (function concat)
    (apply (function append)
      (mapcar (lambda (x) (list "\\(" x "\\)"))
              lis))))
;; test:
;; (rgx-groups "1" "2" "3")
;; (rx (group "1") (group "2") (group "3"))





(defmacro make-syntaxes (name &rest lis)
  (list 'progn ;; need to control eva order
        `(setq ,name
               (make-char-table 'syntax-table (string-to-syntax "w")))
        (cons 'progn
              (mapcar (lambda (char-and-newentry)
                        (append (list 'modify-syntax-entry)
                                char-and-newentry
                                (list name)))
                      lis))))




(make-syntaxes
 word-syntax-table
 ;; default is word constituent
 ;; whitespace characters:
 (   '(0 . 32)    "-"  )
 (      127       "-"  ))

(make-syntaxes
 word-syntax-table-with-symbol&with-open/close-delimiter
 ;; note that, if modify one syntax entry twice
 ;; the second will shadow the first
 ;; whitespace characters:
 (   '(0 . 32)    "-"  )
 (      127       "-"  )
 ;; symbol constituent:
 ;; the following functions need this:
 ;; ``forward-word'' and so on ...
 (  '(33 . 47)    "_"  )
 (  '(58 . 64)    "_"  )
 (  '(91 . 96)    "_"  )
 ( '(123 . 126)   "_"  )
 ;; open/close delimiter:
 ;; the following functions need this:
 ;; ``forward-sexp'' ``backward-sexp''
 ;; ``mark-sexp'' and so on ...
 (  ?\(    "("  )
 (  ?\)    ")"  )
 (  ?\[    "("  )
 (  ?\]    ")"  )
 (  ?\{    "("  )
 (  ?\}    ")"  ))

(make-syntaxes
 word-syntax-table-with-symbol
 ;; note that, if modify one syntax entry twice
 ;; the second will shadow the first
 ;; whitespace characters:
 (   '(0 . 32)    "-"  )
 (      127       "-"  )
 ;; symbol constituent:
 ;; the following functions need this:
 ;; ``forward-word'' and so on ...
 (  '(33 . 47)    "_"  )
 (  '(58 . 64)    "_"  )
 (  '(91 . 96)    "_"  )
 ( '(123 . 126)   "_"  ))

(make-syntaxes
 word-syntax-table-with-open/close-delimiter
 ;; note that, if modify one syntax entry twice
 ;; the second will shadow the first
 ;; whitespace characters:
 (   '(0 . 32)    "-"  )
 (      127       "-"  )
 ;; open/close delimiter:
 ;; the following functions need this:
 ;; ``forward-sexp'' ``backward-sexp''
 ;; ``mark-sexp'' and so on ...
 (  ?\(    "("  )
 (  ?\)    ")"  )
 (  ?\[    "("  )
 (  ?\]    ")"  )
 (  ?\{    "("  )
 (  ?\}    ")"  ))







(defun make-faces-help (alist)
  (mapcar (lambda (face-definiton)
            (eval (append '(defface)
                          (list (car face-definiton)
                                (cons 'quote (cdr face-definiton)))
                          '("") )))
          alist))

(defmacro make-faces (&rest alist)
  `(make-faces-help (quote ,alist)))




(defun say-for-turn-off-indent ()
  (interactive)
  (back-to-indentation)
  (message "<tab> indentation has been turn off."))

(setq function-before-turn-on-indent
      (lambda () (interactive)
        (message "<tab> indentation has not been turned off yet.")))
(defun turn-off-indent ()
  (interactive)
  (setq function-before-turn-on-indent
        (lookup-key (current-local-map) (kbd "<tab>")))
  (local-set-key (kbd "<tab>") 'say-for-turn-off-indent)
  (message "turning off <tab> indentation."))

(defun turn-on-indent ()
  (interactive)
  (local-set-key (kbd "<tab>") function-before-turn-on-indent)
  (message "turning on <tab> indentation."))


(defun move-line-foreword ()
  (interactive)
  (if (char-equal 10 (char-before))
      (insert " ")
    (progn
      (point-to-register 666)
      (move-beginning-of-line 1)
      (insert " ")
      (jump-to-register 666))))

(defun move-line-backword ()
  (interactive)
  (point-to-register 666)
  (move-beginning-of-line 1)
  (if (char-equal 32 (char-after))
      (delete-char 1))
  (jump-to-register 666))









(defun change-parentheses ()
  (interactive)
  (cond ((looking-at "\(")
         (message "( ) --> [ ]")
         (let ()
           (delete-char 1)
           (insert "[")
           (backward-char 1)
           (with-syntax-table
               word-syntax-table-with-open/close-delimiter
             (forward-sexp 1)))
         (let ()
           (delete-char -1)
           (insert "]")
           (with-syntax-table
               word-syntax-table-with-open/close-delimiter
             (forward-sexp -1))))

        ((looking-at "\\[")
         (message "[ ] --> { }")
         (let ()
           (delete-char 1)
           (insert "{")
           (backward-char 1)
           (with-syntax-table
               word-syntax-table-with-open/close-delimiter
             (forward-sexp 1)))
         (let ()
           (delete-char -1)
           (insert "}")
           (with-syntax-table
               word-syntax-table-with-open/close-delimiter
             (forward-sexp -1))))

        ((looking-at "\{")
         (message "{ } --> ( )")
         (let ()
           (delete-char 1)
           (insert "(")
           (backward-char 1)
           (with-syntax-table
               word-syntax-table-with-open/close-delimiter
             (forward-sexp 1)))
         (let ()
           (delete-char -1)
           (insert ")")
           (with-syntax-table
               word-syntax-table-with-open/close-delimiter
             (forward-sexp -1))))

        (t ;;else
         (message "change-parentheses have nothing to do here !"))))

(provide 'xyhlib)
