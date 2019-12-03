
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride))))

(define (string-append-map string-list suffix)
  (map (lambda (x) (string-append x suffix)) string-list))

(define (list-nth-mod xs n)
  (cond [(negative? n) (error "list-nth-mod: negative number")]
        [(empty? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs (remainder n (length xs))))]))

(define (stream-for-n-steps stream n)
  (letrec ([f (lambda (s ans)
                (let ([pr (s)])
                  (if (> ans n)
                      null
                      (cons (car pr) (f (cdr pr) (+ ans 1))))))])
    (f stream 1)))

(define funny-number-stream
  (letrec ([f (lambda (x)
                (if (= (remainder x 5) 0)
                    (cons (- x) (lambda () (f (+ x 1))))
                    (cons x (lambda () (f (+ x 1))))))])
    (lambda () (f 1))))

(define dan-then-dog
  (letrec ([f (lambda (x) (cons x (lambda ()
                                    (if (string=? x "dan.jpg")
                                        (f "dog.jpg")
                                        (f "dan.jpg")))))])
    (lambda () (f "dan.jpg"))))

(define (stream-add-zero stream)
  (letrec ([f (lambda (s)
                (let ([pr (s)])
                  (cons (cons 0 (car pr)) (lambda () (f (cdr pr))))))])
    (lambda () (f stream))))

(define (cycle-lists xs ys)
  (letrec ([f (lambda (n)
                (cons (cons (list-nth-mod xs n) (list-nth-mod ys n))
                      (lambda () (f (add1 n)))))])
      (lambda() (f 0))))

(define (vector-assoc v vec)
  (letrec ([f (lambda (i)
                (if (>= i (vector-length vec))
                    #f
                    (let ([next-pair (vector-ref vec i)])
                      (cond [(not (pair? next-pair)) (f (add1 i))]
                            [(equal? v (car next-pair)) next-pair]
                            [#t (f (add1 i))]))))])
    (f 0)))












                