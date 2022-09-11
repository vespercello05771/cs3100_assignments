#lang racket

(define (size l x) (if (null? l) x (size (cdr l) (+ x 1 )) ))

(define (change lst idx val)
  (if (>= idx (size lst 0)) (append lst (list val))
  (if (null? lst)
    lst
    (cons
      (if (zero? idx)
        val
        (car lst))
      (change (cdr lst) (- idx 1) val)))))

(define fetch-idx (lambda (ff f a idx) (if (null? f) idx (if (ff a (car (car f))) idx (fetch-idx ff (cdr f) a (+ idx 1))))))
(define fetch-val (lambda (f id idx) (if (null? f) '() (if (= id idx) (car f) (fetch-val (cdr f)  id (+ idx 1))))))

(define add-to (lambda (ff f a) (if (null? f) (list (list a)) (change f (fetch-idx ff f a 0) (append (fetch-val f (fetch-idx ff f a 0) 0) (list a))))))
(define eqGroupify (lambda (ff l) (letrec ([util (lambda (ff l f) (if (null? l) f (util ff (cdr l) (add-to ff f (car l)))))]) (util ff l '()))))


;(eqGroupify (lambda (x y) (eq? (remainder x 3) (remainder y 3))) '(1 2 3 4 5 6))