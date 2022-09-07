#lang racket

(define iteration-space 
  (lambda (l) (if (> (car l)  (car (cdr l))) '() (append (list (car l)) (iteration-space (list (+ (car l) (car (cdr (cdr l)))) (car (cdr l)) (car (cdr (cdr l))) ))) )))



(define (size l) (letrec ([size-util (lambda (l n) (if (empty? l) n (size-util (cdr l) (+ n 1))))]) (size-util l 0)))

(define lis (iteration-space l))

(define (make-iterator l) )

(define (next l) (if (null? l) '() ))

(define (hasNext l) (if (<= (size l) 1) #f #t))


(define myItr (make-iterator '(0 10 2)))
(next myItr)
(hasNext myItr) 
(next myItr) 
(next myItr)
(next myItr) 
(next myItr) 
(next myItr) 
(next myItr)
(hasNext myItr)