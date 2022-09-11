#lang racket


(define make
  (lambda (setty l last)
    (if (null? l) setty
        (if (equal? last (car l)) (make setty (cdr l) last) (make (append setty (list (car l))) (cdr l) (car l))))))

(define make-setty-list (lambda (l) (if (null? l) '() (make (list (car l)) (cdr l) (car l)))))

;(make-setty-list '(1 2 2 1 3 3 3 3 3 3 3))

(define setty-list-union (lambda (l1 l2) (make-setty-list (append l1 l2))))
;(setty-list-union '(1 2 1 3) '(3 2))

(define setty-list-minus
  (lambda (l1 l2) (letrec([overall-removal (lambda (l3 l2)
                                             (if (null? l2) l3 (overall-removal (remove (car l2) l3) (cdr l2))))]
                          [remove (lambda (a l)
                                    (if (null? l) l (if (equal? a (car l)) (cdr l) (append (list (car l)) (remove a (cdr l))))))]) (overall-removal l1 l2))))

;(setty-list-minus '(1 2 1 3) '(1 3)) 
