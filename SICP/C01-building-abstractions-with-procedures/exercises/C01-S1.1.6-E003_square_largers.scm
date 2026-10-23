;;; File:          C01-S1.1.6-E003_square_largers.scm
;;; Author:        Miquéias Medeiros <https://github.com/miqu3iasg>
;;; Created:       2026-09-30
;;; Modified:      2026-09-30
;;; Source:        Structure and Interpreation of Computer Programs (SICP)
;;; By:            Harold Abelson, Gerald Jay Sussman, Julie Sussman
;;; Location:      p. 27
;;;
;;; Exercise 1.3: Deﬁne a procedure that takes three numbers
;;; as arguments and returns the sum of the squares of the two
;;; larger numbers.
;;;
;;; Usage:
;;;     Run:
;;;     $ mit-scheme --quiet --load C01-S1.1.6-E003_square_largers.scm
;;;
;;;     To evaluate line by line, use ,ee and ,er in the REPL.
;;;
;;; References:
;;;     - https://en.wikibooks.org/wiki/Scheme_Programming/Using_Variables
;;;     - https://jaredkrinke.github.io/learn-scheme/1-1-6-conditionalexp.html
;;;
;;; SPDX-License-Identifier: AGPL-3.0-only
;;; Copyright:     (c) 2026 Miquéias Medeiros <https://github.com/miqu3iasg>.


#|
Using pseudocode to help organize my thoughts.

The idea isn't to directly find the two largest, but rather to find the
smallest of the three, so that the remaining two are the largest.

if (a <= b && a <= c)
    return b, c

if (b <= a && b <= c)
    return a, c

if (c <= a && c <= b)
    return a, b

|#
(define (square-largers a b c)
  (cond ((and (<= a b) (<= a c)) (+ (* b b) (* c c)))
        ((and (<= b a) (<= b c)) (+ (* a a) (* c c)))
        ((and (<= c a) (<= c b)) (+ (* a a) (* b b)))))

(square-largers 2 5 4) ; => 41
