#lang racket

(define for-loop
  (lambda (f l) (if (> (car l)  (car (cdr l))) '() (append (list (f (car l))) (for-loop f (list (+ (car l) (car (cdr (cdr l)))) (car (cdr l)) (car (cdr (cdr l))) ))) )))

;(for-loop (lambda (x) (+ 3 x)) '(0 10 2))