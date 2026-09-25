; File:          C01-S1.1.5-P005_substituition_model_procedure_application.scm
; Author:        Miquéias Alves Medeiros <https://github.com/miqu3iasg>
; Created:       2026-09-24
; Modified:      2026-09-24
; Source:        Structure and Interpreation of Computer Programs (SICP)
; By:            Harold Abelson, Gerald Jay Sussman, Julie Sussman
; Location:      pp. 18-22
;
; Study of the substitution model for procedure application, including how
; compound procedures are evaluated by substituting arguments for formal
; parameters, the distinction between applicative-order and normal-order
; evaluation, and the expand-and-reduce process used to model procedure evaluation.
;
; SPDX-License-Identifier: AGPL-3.0-only
; Copyright:     (c) 2026 Miquéias Alves Medeiros <https://github.com/miqu3iasg>.



; To evaluate a combination in which the operator names a compound procedure, the
; interpreter follows pratically the same steps used for combinations whose the operators
; name primitive procedures, which we saw in the section 1.1.3.
;
; See: C01-S1.1.3-P003_evaluating_combinations.scm

; The mechanism for applying primite procedures is built into the interpreter.
; For compound procedures, the application process essentially follows these steps:
; To apply a compound procedure to their arguments, you basically need to evaluate
; the entire expression in the procedure body and apply it to each formal parameter
; replacing each one with its corresponding argument.

; To represent this, we will revisit the procedure defined in section 1.1.4 and
; evaluate the combination.
;
; See: C01-S1.1.4-P004_compound_procedures.scm

; Produces the square of an integer
(define (square x) (* x x ))

; Given any two numbers as arguments, produces the sum of their squares
(define (sum-of-squares x y)
  (+ (square x) (square y)))

; Consider this definition: f(x) = (a + 1)² + (a x 2)². We can represent this in
; the following way:
(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

; Now, let's evaluate the combination f(5):
(f 5) ; 136

; First, we need to retrieve the body of f, which is
;
; (sum-of-squares (+ a 1) (* a 2)).
;
; Then we replace the formal parameter by the given argument, which in our case is 5.
; Therefore, we have
;
; (sum-of-squares (+ 5 1) (* 5 2)).
;
; Evaluating the operands, we have (+ 5 1) that produces 6, and (* 5 2) that produces 10.
; So we must apply the sum-of-squares procedure to the values found. These values are
; substituted for the formal parameters x and y in the body of sum-of-squares,
; reducing the expression to
;
; (+ (square 6) (square 10)) => (+ (* 6 6) (* 10 10)),
;
; which reduces to
;
; (+ 36 100) => 136.

; This process is called _substituition model_ for procedure application. It essentially
; defines the "meaning" of a procedure application. However, the goal is not to determine
; how an interpreter actually evaluats these procedures, but rather to teach us to think
; about how they work.

; We have another order to evaluate procedures. The order in which the interpreter first
; evaluates the operator and then applies the resulting procedure to the resulting arguments
; is called _applicative-order evaluation_. The other way to do that, is essentially expanding
; the expression until only primitive operators remain, and then reducing the resulting
; expression. This way is called _normal-order evaluation_. If we used this method, the
; evaluation of (f 5) would proceed according to the sequence of expansions:
;
; (sum-of-squares (+ 5 1) (* 5 2))
;
; (+  (square (+ 5 1))       (square (* 5 2)  )
;
; (+  (* (+ 5 1) (+ 5 1))    (* (* 5 2) (* 5 2)))
;
; followed by the reductions
;
; (+        (* 6 6)       (* 10 10))
; (+           36             100)
;                    136
;
; So, the whole process is fully expand and then reduce. For instance, we have another models
; to evaluate procedures. Currently, we are exploring the substitution model. In general, we begin
; with simplified and incomplete models, and then we will discuss more complex and complex models
; along the time, increasingly.
