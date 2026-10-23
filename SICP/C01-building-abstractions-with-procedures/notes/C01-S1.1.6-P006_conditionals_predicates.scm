; File:          C01-S1.1.6-P006_conditionals_predicates.scm
; Author:        Miquéias Alves Medeiros <https://github.com/miqu3iasg>
; Created:       2026-09-25
; Modified:      2026-09-25
; Source:        Structure and Interpreation of Computer Programs (SICP)
; By:            Harold Abelson, Gerald Jay Sussman, Julie Sussman
; Location:      pp. 22-25
;
; Studied conditional expressions and predicates in Scheme, including case analysis,
; piecewise functions, and the use of `cond` and `if` to express conditional behavior.
; Explored the evaluation of predicates and clauses, the use of `else` as a default case,
; and the correspondence between conditional procedures and mathematical piecewise
; definitions. Also studied logical composition with `and`, `or`, and `not`, and used
; these operators to construct compound predicates and express relational conditions.
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

; Here is another way to way to write the absolute-value procedure

(define (abs x)
  (if (< x 0) (- x) x))

; The structure is (if <predicate> <consequent> <alternative>).

; Essentially, its like an if-else statement from other languages, but with an implicit
; `else`. The interpreter evalutes first the <predicate>, and if it is a true value, the
; interpreter evalues the <consequent> and returns its value. On the other hand, if the
; the result of the predicate returns a false value, the interpreter evalutes the
; <alternative> and return its value.

; In addition to primitive predicates such as <, =, and >, there are more logical composition
; operations that we can use to construct expressions, and, in turn, compound expressions.
; Among them, the three most widely used are:
;
; (and ⟨e_1⟩ . . . ⟨e_n⟩)
; (or ⟨e_1⟩ . . . ⟨e_n⟩)
; (not ⟨e⟩)
;
; These operate using the logical structure already known from other programming languages.

; As an example of how these are used, we can express a number x in the interval 5 < x < 10 as
(and (> x 5) (< x 10))

; As another example, we can deﬁne a predicate to test whether one number is greater than
; or equal to another as
(define (>= x  y) (or (> x y) (= x y)))

; In another language, this could be expressed, for example, in an if statement, as
;
; if (x >= y) {
;     ...
; }
;
; if (x > y || x == y) {
;     ...
; }

; Or, alternatively, we can write the same predicate in the following way
(define (>= x y) (not (< x y)))

; which could be expressed in another programming language as
;
; if (x >= y) {
;     ...
; }
;
; if (!(x < y)) {
;     ...
; }
