;;; File:          C01-S1.1.6-E005_aplicative_or_normal_order.scm
;;; Author:        Miquéias Medeiros <https://github.com/miqu3iasg>
;;; Created:       2026-10-01
;;; Modified:      2026-10-01
;;; Source:        Structure and Interpreation of Computer Programs (SICP)
;;; By:            Harold Abelson, Gerald Jay Sussman, Julie Sussman
;;; Location:      p. 27
;;;
;;; Exercise 1.5: Ben Bitdiddle has invented a test to determine
;;; whether the interpreter he is faced with is using applicative-
;;; order evaluation or normal-order evaluation. He deﬁnes the
;;; following two procedures.
;;;
;;; Usage:
;;;     Run:
;;;     $ mit-scheme --quiet --load C01-S1.1.6-E005_aplicative_or_normal_order.scm
;;;
;;;     To evaluate line by line, use ,ee and ,er in the REPL.
;;;
;;; References:
;;;     - C01-S1.1.5-P005_substituition_model_procedure_application.scm
;;;     - C01-S1.1.6-P006_conditionals_predicates.scm
;;;     - C01-S1.1.4-P004_compound_procedures.scm
;;;     - https://berkeley-cs61as.github.io/textbook/normal-order-and-applicative-order.html
;;;     - https://cs.stackexchange.com/questions/40758/difference-between-normal-order-and-applicative-order-evaluation
;;;
;;; SPDX-License-Identifier: AGPL-3.0-only
;;; Copyright:     (c) 2026 Miquéias Medeiros <https://github.com/miqu3iasg>.


#|
First, we define a procedure named `p`. Next, we call this procedure within
another procedure defined as `test`, passing it as the second parameter
received by the latter. In this test, if the first received parameter is equal
to zero, then return zero. Otherwise, the second parameter is returned.

The complete code could be in C:

void p(void)
{
    p();
}

int test(int x, int y)
{
    if (x == 0)
        return 0;

    return y;
}

int main(void)
{
    test(0, p());
}

Essentially, this a function calling itself. `p()` has no useful return value,
so its evaluation never ends, it is a infinite loop.
|#

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;; Substituting x = 0 and y = (p), we have:

#; (define (test 0 (p))
  (if (= 0 0) 0 y))  ; => true

#|
Since x is equal to zero, the result of this procedure is 0, following the
applicative-order.

I am assuming that, to distinguish which evaluation order the interpreter is
using, the output of the test function needs to be different for each case
(x for applicative-order evaluation and y for normal-order evaluation). Why?
I can't answer it yet.

Doing some searches, I figured out that the aplicative-order evaluates the
paremeters first, and then applies the body of the function. So, if the
interpreter is using applicative-order, it never finish the evaluation in this
case, because one of the parameters is a recursive function (p) that calls itself
indefinitely as we discussed above. So my first statement where I say that x is
zero following the applicative-order is not valid.

In contrast, when the interpreter uses normal-order evaluation, we get a
different result. The interpreter substitutes the parameters with the
corresponding arguments without evaluating them first, so we get something like
this:

(test 0 (p)) => (if (= 0 0) 0 (p))

Then, it evaluates the condition `(= 0 0)`, which is true.

So, the final result is simply zero. This way, the alternative expression (p)
would never be evaluated.
|#
