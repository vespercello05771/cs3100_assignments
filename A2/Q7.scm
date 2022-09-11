#lang racket


(define iter-fib (lambda (n) (letrec ([iterate-recursively (lambda (n one two a) (if (= a 0) one (iterate-recursively n two (+ one two) (- a 1))))]) (iterate-recursively n 0 1 n)) ))

;(iter-fib 29)



