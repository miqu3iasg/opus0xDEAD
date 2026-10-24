;;; File:          C01-S1.1.7-P007_square_root_procedure_example.scm
;;; Author:        Miquéias Alves Medeiros <https://github.com/miqu3iasg>
;;; Created:       2026-10-19
;;; Modified:      2026-10-19
;;; Source:        Structure and Interpreation of Computer Programs (SICP)
;;; By:            Harold Abelson, Gerald Jay Sussman, Julie Sussman
;;; Location:      pp. 28-32
;;;
;;; I studied the distinction between ordinary mathematical functions and
;;; computational procedures, and did a practical experiment about resolving
;;; square roots using Newton's method.
;;;
;;; SPDX-License-Identifier: AGPL-3.0-only
;;; Copyright:     (c) 2026 Miquéias Alves Medeiros <https://github.com/miqu3iasg>.

#|
Procedures as we've seen before, are more likely to ordinary mathematical functions.
They specify a value that is determined by parameters. However, there's a difference
between procedures and mathematical functions: procedures must to produce results,
that is, there must be active and imperative actions, whereas mathematical functions
are more concerned with describing the behavior of something, they are declarative.

As an example, consider the problem of computing square roots. We can define the square-
root function as

√x = the y such that y >= 0 and y² = x.

This describes a perfectly legitimate mathematical function. But how to calculate
square roots?

The most common method is Newton's method, is a root-finding algorithm which produces
successively better approximations to the roots (or zeroes) of a real-valued function.
Basically, you need to take a guess and get closer to it based on the result you received.
Continuing this process, we get better and better approximations to the square root.

See: https://en.wikipedia.org/wiki/Newton%27s_method
|#

;; In code, we can write this
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

;; A guess is improved by averaging it with the quotient of the radicand
;; and the old guess
(define (improve guess x)
  (average guess (/ x guess)))

;; where average is
(define (average x y)
  (/ (+ x y) 2))

;; And we need also to define what is "good enough". The idea is improve the answer till
;; it is close enough so that its square diﬀers from the radicand by less than
;; a predetermined tolerance (here is 0.001)
(define (square x) (* x x ))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; Finally, we need a way to get started. For instance, we can always guess
;; that the square root of any number is 1
(define (sqrt x)
  (sqrt-iter 1.0 x))

;; And now we can use this as any other procedure

(sqrt 9) ; => 3.00009155413138

(sqrt (+ 100 37)) ; => 11.704699917758145

(sqrt (+ (sqrt 2) (sqrt 3))) ; => 1.7739279023207892

#|
"The sqrt program also illustrates that the simple procedural language we have
introduced so far is suﬃcient for writing any purely numerical program that
one could write in, say, C or Pascal. This might seem surprising, since we have
not included in our language any iterative (looping) constructs that direct the
computer to do something over and over again. sqrt-iter, on the other hand,
demonstrates how iteration can be accomplished using no special construct other
than the ordinary ability to call a procedure."

See: Structure and Interpreation of Computer Programs (SICP), pp. 31-32.
|#
