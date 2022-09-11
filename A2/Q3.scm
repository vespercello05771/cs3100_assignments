#lang racket

(define iteration-space 
  (lambda (l) (if (> (car l)  (car (cdr l))) '() (append (list (car l)) (iteration-space (list (+ (car l) (car (cdr (cdr l)))) (car (cdr l)) (car (cdr (cdr l))) ))) )))



(define (size l) (letrec ([size-util (lambda (l n) (if (empty? l) n (size-util (cdr l) (+ n 1))))]) (size-util l 0)))

(define (make-iterator l) (box (cons 0 (iteration-space l))))

(define set-it (lambda (l)  (if (<= (size (unbox l)) 0) (box '(())) (set-box! l (cdr (unbox l))))))
(define next-util (lambda (l set-it) (set-it l) (if(null? (unbox l)) '() (car (unbox l)) )))
(define next (lambda (l) (if (null? (unbox l)) '() (next-util l set-it))))
(define (hasNext l) (if (<= (size (unbox l)) 1) #f #t))

