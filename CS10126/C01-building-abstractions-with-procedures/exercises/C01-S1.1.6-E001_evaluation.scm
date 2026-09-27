;;; File:          C01-S1.1.6-E001_evaluation.scm
;;; Author:        Miquéias Medeiros <https://github.com/miqu3iasg>
;;; Created:       2026-09-26
;;; Modified:      2026-09-26
;;; Source:        Structure and Interpreation of Computer Programs (SICP)
;;; By:            Harold Abelson, Gerald Jay Sussman, Julie Sussman
;;; Location:      p. 26
;;;
;;; Solutions for SICP Exercise 1.1. This file presents a sequence of basic
;;; Scheme expressions—covering arithmetic operations, variable definitions,
;;; and conditional logic (if, cond, and)—along with step-by-step evaluations
;;; and expected interpreter outputs, demonstrating the substitution model.
;;;
;;; Problem Statement:
;;;     Exercise 1.1: Below is a sequence of expressions. What is the result
;;;     printed by the interpreter in response to each expression? Assume that
;;;     the sequence is to be evaluated in the order in which it is presented.
;;;
;;; Usage:
;;;     Run:
;;;     $ mit-scheme --quiet --load C01-S1.1.6-E001_evaluation.scm
;;;
;;;     To evaluate line by line, use ,ee and ,er in the REPL.
;;;
;;; References:
;;;     - https://jaredkrinke.github.io/learn-scheme/1-1-6-conditionalexp.html
;;;
;;; SPDX-License-Identifier: AGPL-3.0-only
;;; Copyright:     (c) 2026 Miquéias Medeiros <https://github.com/miqu3iasg>.


;;; Expression 01
;; Here the interpreter returns the number itself. So the result is simply 10.
10 ; 10


;;; Expression 02
;; Here is just a sum, so the result is 5 + 3 + 4 which is 12.
(+ 5 3 4) ; 12


;;; Expression 03
;; Here is just a subtraction, so the result is just 9 - 1 which is 8.
(- 9 1) ; 8


;;; Expression 04
;; Here is a division, so the result is 6 / 2 which is 3.
(/ 6 2) ; 3


;;; Expression 05
;; Here is just a simple expression in which can be represented as
;; (2 * 4) + (4 - 6) => 8 + (-2) => 8 - 2 = 6.
(+ (* 2 4) (- 4 6)) ; 6


;;; Expression 06
;; a = 3
(define a 3) ; a


;;; Expression 07
;; b = a + 1 => b = 3 + 1 = 4 => b = 4.
(define b (+ a 1)) ; b


;;; Expression 08
;; a + b + (a * b) => 3 + 4 + (3 * 4) => 7 + 12 = 19.
(+ a b (* a b)) ; 19


;;; Expression 09
;; This a comparation. a is not equal to b, so it is false.
(= a b) ; #f


;;; Expression 10
#|
Using pseudocode to help me think this through, it would look like this:

if (b > a && b < (a * b)) {
    return b
} else {
    return a
}

Now let's substitute the values:
if (4 > 3 && 4 < (3 * 4)) { return 4 } else { return 3 }

(4 > 3 && 4 < (3 * 4)) -> true condition.
So, the result is 4.
|#
(if (and (> b a) (< b (* a b)))
    b
    a) ; 4


;;; Expression 11
#|
Analogously to the previous pseudocode, this could be represented as:

if (a == 4) return 6

elif (b == 4) return (6 + 7 + a)

else return 25

We know that a = 3 and b = 4, so:

if (3 == 4) return 6 -> False.

elif (b == 4) return (6 + 7 + a) -> True. Then return 6 + 7 + 3 which is 16.

else return 25 -> Since the previous evaluation returned a true value, the
interpreter doesn't evaluate this.

So, the result is 16.
|#
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)) ; 16


;;; Expression 12
;; 2 + b => 2 + 4 = 6.
(+ 2 (if (> b a) b a)) ; => 6


;;; Expression 13
;; 4 * (3 + 1) => 4 * 4 = 16.
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1)) ; 16
