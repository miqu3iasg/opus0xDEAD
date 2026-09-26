; File:          C01-S1.1.6-P006_conditionals_predicates.scm
; Author:        Miquéias Alves Medeiros <https://github.com/miqu3iasg>
; Created:       2026-09-25
; Modified:      2026-09-25
; Source:        Structure and Interpreation of Computer Programs (SICP)
; By:            Harold Abelson, Gerald Jay Sussman, Julie Sussman
; Location:      pp. 22-25
;
; what you implemented / learned here
;
; SPDX-License-Identifier: AGPL-3.0-only
; Copyright:     (c) 2026 Miquéias Alves Medeiros <https://github.com/miqu3iasg>.


; Case analysis is a reasoning technique in which we can break a problem down in multiple
; disctint cases, and then analyse each case separately in accordance with the conditions
; that caracterize it.
;
; A piecewise function (função definida por partes) specifies different behaviors for
; different cases. A case analysis performs a similar function in reasoning: it identifies
; the different cases and applies the appropriate analysis to each term.
;
;       {  x if x > 0
; |x| = {  0 if x = 0
;       { -x if x < 0
;
; In Lisp, we have a notation for case analysis. It is called `cond` (which stands for
; "conditional"), and it is used as follows

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

; The general form of a conditional expression is
;
; (cond (⟨p1⟩ ⟨e1⟩)
;       (⟨p2⟩ ⟨e2⟩)
;       ...
;       (⟨pn⟩ ⟨en⟩))
;
; The pair of expressions (⟨p⟩ ⟨e⟩) are called clauses. The first expression in each pair
; is a predicate, that is, an expression that, when evaluated, can be true or false.

; Abelson, Sussman & Sussman (1996, p. 23) describe the evaluation of conditional
; expressions as follows: "The predicate <p1> is evaluated first. If its value is false,
; then <p2> is evaluated. If <p2>'s value is also false, then <p3> is evaluated. This
; process continues until a predicate is found whose value is true, in which case the
; interpreter returns the value of the corresponding consequent expression <e> of the
; clause as the value of the conditional expression. If none of the <p>'s is found to
; be true, the value of the cond is undefined."

; This is another way to write a conditional procedures. Basically, it says: if x is
; less than zero, then return -x. Otherwise, just return x for any other case. `else`
; is a special symbol that can be used in place of the ⟨p⟩ in the ﬁnal clause of a cond.

(define (abs x)
  (cond ((< x 0) (- x))
  (else x)))

; The matematical representation of this procedure would be
;
;       { -x if X < 0
; |x| = {
;       {  x for any other case
