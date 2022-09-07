#lang racket

(define mix (lambda (l1 l2) (map cons l1 l2)))
(mix '(1 2 3) '(alpha beta gamma))

(define unmix (lambda (l) (cons (map car l) (list (map cadr l)))))
(unmix '((1 alpha) (2 beta) (3 gamma)))
