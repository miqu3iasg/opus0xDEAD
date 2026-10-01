;;; File:          C01-S1.1.6-E002_translate_expression.scm
;;; Author:        Miquéias Medeiros <https://github.com/miqu3iasg>
;;; Created:       2026-09-30
;;; Modified:      2026-09-30
;;; Source:        Structure and Interpreation of Computer Programs (SICP)
;;; By:            Harold Abelson, Gerald Jay Sussman, Julie Sussman
;;; Location:      p. 27
;;;
;;; Implementation of Exercise 1.2 from Structure and Interpretation of Computer
;;; Programs (SICP), which asks to translate a given arithmetic expression from
;;; conventional infix notation into Scheme's prefix notation.
;;;
;;;
;;; Problem Statement:
;;;     Exercise 1.2: Translate the following expression into prefix form.
;;;
;;;        5 + 4 + (2 - (3 - (6 + 4/5)))
;;;        -----------------------------
;;;              3(6 - 2)(2 - 7)
;;;
;;; Usage:
;;;     Run:
;;;     $ mit-scheme --quiet --load C01-S1.1.6-E002_translate_expression.scm
;;;
;;;     To evaluate line by line, use ,ee and ,er in the REPL.
;;;
;;; SPDX-License-Identifier: AGPL-3.0-only
;;; Copyright:     (c) 2026 Miquéias Medeiros <https://github.com/miqu3iasg>.

#|
To solve this problem, I thought in terms of layers. First, I broke down the
numerator, treating each part as a distinct expression and combining them at
the end. Then I moved on to the denominator and did the same thing. Finally, I
simply divided the two resulting expressions, thereby completing the problem.

The same expression in C could be

double expression(void) {
    return (5 + 4 + (2 - (3 - (6 + 4.0 / 5.0))))
        / (3 * (6 - 2) * (2 - 7));
}
|#
(define (expression)
  (/
    (+ 5 4
       (- 2
          (- 3
             (+ 6
                (/ 4 5)))))
    (* 3
       (- 6 2)
       (- 2 7))))

(expression) ; => -37/150
