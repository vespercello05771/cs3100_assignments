#lang racket

(define aquire (lambda (l lpr) (if (null? l) lpr (if (list? (car l)) (aquire (cdr l) (append lpr (aquire (car l) '()))) (aquire (cdr l) (append lpr (list (car l))))))))

(define max-level
  (lambda (l x max)
    (if (null? l)
        max
        (if (list? (car l))
             (if(> (+ x (max-level (car l) 1 1)) max)
                (max-level (cdr l) x (+ x (max-level (car l) 1 1))) (max-level (cdr l) x max))
             (max-level (cdr l) x max)))))

(define nest (lambda (n l) (letrec ([util (lambda (n l x) (if (= n x) l (list (util n l (+ x 1)))))]) (util n l 1))))

(define push-element (lambda (l) (nest (max-level l 1 1) (aquire l '()))))

;(push-element '(1 2 3))

;(push-element '(((1 2) (3 4) 5)))
;(push-element '(1 2 (3) ((4))))
