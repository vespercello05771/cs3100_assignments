#lang racket

(define make-iterator (lambda (l) (letrec ((next (lambda (n)
(delay )))))
(cdr l)))

(define next(lambda (l) (force (car l))))


