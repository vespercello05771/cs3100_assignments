#lang racket


(define create-symbol-table (lambda (l) l))

(define lookup(lambda (l symb) (if (null? l) '() (if (equal? (car (car l)) symb) (car (cdr (car l))) (lookup (cdr l) symb)))))

(define myST (create-symbol-table '((a 3) (b 6))))

;(lookup myST 'b)
;(lookup myST 'c)

(define extend-symbol-table (lambda (l1 l2) (append l2 l1)))
(define myST2 (extend-symbol-table myST '((e 2) (b 7) (d 5))))
;(lookup myST2 'b) 
;(lookup myST2 'd) 
;(lookup myST 'b)
