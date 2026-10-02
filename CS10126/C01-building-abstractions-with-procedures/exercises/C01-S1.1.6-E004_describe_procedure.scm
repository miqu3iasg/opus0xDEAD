;;; File:          C01-S1.1.6-E004_describe_procedure.scm
;;; Author:        Miquéias Medeiros <https://github.com/miqu3iasg>
;;; Created:       2026-10-01
;;; Modified:      2026-10-01
;;; Source:        Structure and Interpreation of Computer Programs (SICP)
;;; By:            Harold Abelson, Gerald Jay Sussman, Julie Sussman
;;; Location:      p. 27
;;;
;;; Exercise 1.4: Observe that our model of evaluation allows
;;; for combinations whose operators are compound expres-
;;; sions. Use this observation to describe the behavior of the
;;; following procedure.
;;;
;;; Usage:
;;;     Run:
;;;     $ mit-scheme --quiet --load C01-S1.1.6-E004_describe_procedure.scm
;;;
;;;     To evaluate line by line, use ,ee and ,er in the REPL.
;;;
;;; References:
;;;     - C01-S1.1.4-P004_compound_procedures.scm
;;;     - C01-S1.1.5-P005_substituition_model_procedure_application.scm
;;;     - C01-S1.1.6-P006_conditionals_predicates.scm
;;;
;;; SPDX-License-Identifier: AGPL-3.0-only
;;; Copyright:     (c) 2026 Miquéias Medeiros <https://github.com/miqu3iasg>.


#|
In this book, we use applicative-order evaluation, which means the interpreter
evaluates the operator first, and then applies the resulting procedure to the
resulting arguments.

Here, the procedure varies depending on whether the `if` conditional expression
evaluates to true or false. It does not return values per se, but rather
procedures for the interpreter—specifically, to add (+) or subtract (-).

The condition specified here states that if `b` is greater than zero, a summation
procedure is performed using the parameters `a` and `b`. Conversely, if `b` is less
than or equal to zero, a subtraction procedure is performed instead. In other words,
once the condition `(> b 0)` is evaluated, its resulting procedure is used as the
operator for the remaining expression.
|#
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
