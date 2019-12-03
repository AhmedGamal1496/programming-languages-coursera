#lang racket
;; Programming Languages Homework4 Simple Test
;; Save this file to the same directory as your homework file
;; These are basic tests. Passing these tests does not guarantee that your code will pass the actual homework grader

;; Be sure to put your homework file in the same folder as this test file.
;; Uncomment the line below and change HOMEWORK_FILE to the name of your homework file.
(require "hw4.rkt")

(require rackunit)

;; Helper functions
(define ones (lambda () (cons 1 ones)))

(define (stream-maker fn arg)
  (letrec ([f (lambda (x)
              (cons x (lambda () (f (fn x arg)))))])
  (lambda () (f arg))))

(define a 2)

(define tests
  (test-suite
   "Sample tests for Assignment 4"
   
   ; sequence test
   (check-equal? (sequence 0 5 1) (list 0 1 2 3 4 5) "Sequence test1")
   (check-equal? (sequence 0 5 3) (list 0 3) "Sequence test2")
   (check-equal? (sequence 5 1 2) (list ) "Sequence test3")
   (check-equal? (sequence 1 1 1) (list 1) "Sequence test4") 

   ; string-append-map test
   (check-equal? (string-append-map 
                  (list "dan" "dog" "curry" "dog2") 
                  ".jpg") '("dan.jpg" "dog.jpg" "curry.jpg" "dog2.jpg") "string-append-map test")
   
   ; list-nth-mod test
   (check-equal? (list-nth-mod (list 0 1 2 3 4) 2) 2 "list-nth-mod test")
   
   ; stream-for-n-steps test
   (check-equal? (stream-for-n-steps ones 4) (list 1 1 1 1) "stream-for-n-steps test1")
   (check-equal? (stream-for-n-steps (stream-maker + 1) 3) (list 1 2 3) "stream-for-n-steps test2")
   (check-equal? (stream-for-n-steps (stream-maker * 2) 4) (list 2 4 8 16) "stream-for-n-steps test3")
   
   ; funny-number-stream test
   (check-equal? (stream-for-n-steps funny-number-stream 16) (list 1 2 3 4 -5 6 7 8 9 -10 11 12 13 14 -15 16) "funny-number-stream test")
   
   ; dan-then-dog test
   (check-equal? (stream-for-n-steps dan-then-dog 1) (list "dan.jpg") "dan-then-dog test1")
   (check-equal? (stream-for-n-steps dan-then-dog 4) (list "dan.jpg" "dog.jpg" "dan.jpg" "dog.jpg") "dan-then-dog test2")
   
   ; stream-add-zero test
   (check-equal? (stream-for-n-steps (stream-add-zero ones) 1) (list (cons 0 1)) "stream-add-zero test1")
   (check-equal? (stream-for-n-steps (stream-add-zero ones) 3) (list (cons 0 1) (cons 0 1) (cons 0 1)) "stream-add-zero test2")
   (check-equal? (stream-for-n-steps (stream-add-zero (stream-maker + 1)) 3) (list (cons 0 1) (cons 0 2) (cons 0 3)) "stream-add-zero test3")
   (check-equal? (stream-for-n-steps (stream-add-zero (stream-maker * 2)) 3) (list (cons 0 2) (cons 0 4) (cons 0 8)) "stream-add-zero test4")
   
   ; cycle-lists test
   (check-equal? (stream-for-n-steps (cycle-lists (list 1 2 3) (list "a" "b")) 5) (list (cons 1 "a") (cons 2 "b") (cons 3 "a") (cons 1 "b") (cons 2 "a")) 
                 "cycle-lists test1")
   (check-equal? (stream-for-n-steps (cycle-lists (list 1 2 3) (list "a" "b" "c")) 5) (list (cons 1 "a") (cons 2 "b") (cons 3 "c") (cons 1 "a") (cons 2 "b")) 
                 "cycle-lists test2")
   
   ; vector-assoc test
   (check-equal? (vector-assoc 4 (vector (cons 2 1) (cons 3 1) (cons 4 8) (cons 5 1))) (cons 4 8) "vector-assoc test1")
   (check-equal? (vector-assoc 9 (vector (cons 2 1) (cons 3 1) (cons 4 15) (cons 5 1))) #f "vector-assoc test2")
   (check-equal? (vector-assoc 5 (vector (cons 2 1) (cons 3 1) 4 (cons 4 10) 8 (cons 5 1))) (cons 5 1) "vector-assoc test3")
   (check-equal? (vector-assoc 3 (vector (cons 2 1) (cons 3 1) (cons 4 20) (cons 3 2))) (cons 3 1) "vector-assoc test4")
   (check-equal? (vector-assoc 9 (vector (cons 2 1) 8 (cons 3 1) (cons 4 15) (cons 5 1))) #f "vector-assoc test5")
   
   ; cached-assoc tests
;;   (check-equal? ((cached-assoc (list (cons 1 2) (cons 3 4)) 3) 3) (cons 3 4) "cached-assoc test")
   
   ; while-less test
 ;;  (check-equal? (while-less 7 do (begin (set! a (+ a 1)) a)) #t "while-less test")
   
   ))

(require rackunit/text-ui)
;; runs the test
(run-tests tests)
