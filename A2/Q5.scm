#lang racket

(define maximum-argument(lambda (ff l) (letrec((max-rec (lambda (ff l m) (if (null? l) m (if(> (ff (car l)) (ff m)) (max-rec ff (cdr l) (car l)) (max-rec ff (cdr l) m)))))) (max-rec ff (cdr l) (car l)))))

;(maximum-argument (lambda (x) (* 3 x)) '(2 2 3 1 5))