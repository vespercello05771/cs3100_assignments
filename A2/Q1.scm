#lang racket

(define iteration-space 
  (lambda (l) (if (> (car l)  (car (cdr l))) '() (append (list (car l)) (iteration-space (list (+ (car l) (car (cdr (cdr l)))) (car (cdr l)) (car (cdr (cdr l))) ))) )))

;(iteration-space '(-7 177 100)) 