; File:          C01-S1.1.4-P004_compound_procedures.scm
; Author:        Miquéias Alves Medeiros <https://github.com/miqu3iasg>
; Created:       2026-09-23
; Modified:      2026-09-24
; Source:        Structure and Interpreation of Computer Programs (SICP)
; By:            Harold Abelson, Gerald Jay Sussman, Julie Sussman
; Location:      pp. 15-18
;
; This section introduces compound procedures and explains how procedures can be
; defined and composed to build more complex computations from simpler operations.
; It examines the structure of procedure definitions, including names, formal
; parameters, and bodies, and demonstrates how existing procedures can be combined
; and applied within new procedures.
;
; SPDX-License-Identifier: AGPL-3.0-only
; Copyright:     (c) 2026 Miquéias Alves Medeiros <https://github.com/miqu3iasg>.

; Essentially, a compound procedure is a procedure whose implementation is coposed of
; another existing procedures and operations. This allows a sequence of coding or
; instructions to be abstracted as a single, higher-level operation. In other words,
; this allows more complex computations to be expressed by cobining simpler operations
; and procedures, potentially through multiple levels of of composition. Here is an
; example.

; The procedure square is defined to take an argument x and return the result of
; multiplying x by itself.
(define
  (square x) ; procedure name and parameters
  (* x x ))  ; procedure body

; If we repeat the same structure, breaking it down further, we get something
; like this (the code has been repeated intentionally for learning purposes
; and to aid understanding):

; define a procedure
(define
  ; give the procedure the name square
  (square
    ; take x as an argument
    x)
  ; multiply x by itself
  (* x x))

; Here, we have a compound procedure, that has the name "square". The procedure
; represents the operation of multiplying something by itself. The object to be
; multiplied is named x. If we evaluate this definition, we will have a compound
; procedure, and we will associate it with the name "square".

; The general form of a procedure defintion is:
;
; (define (<name> <formal parameters>)
;   <body>)
;
; The <name> is the symbol that will be associated with the procedure in the environment
; it defines the operation. The <formal parameters> are the names used within the body;
; the objects that will receive the operation defined in the procedure. The <body>
; is precisely an expression that defines the operation to be performed. The <name> and
; the <formal parameters> are grouped within parentheses, in the same way that they will
; the called by the procedure.

; Since we've already defined the square, we can now use that.

(square 21) ; 441

(square (+ 2 5)) ; 49

(square (square 3)) ; 81

; This reminds me functions definitions in modern programming languages, where we define
; the function's name so the environment can get it, the parameters it accepts, and the
; the body where the operation is specified.
;
; In a pseudo-code, this could be somthing like that:
;
; define square (x) {
;     return x * X
; }

; We can also use the square to build another procedure, that is, building a procedure
; with another existing procedure. For example, we can represent x² + y² as:

(+ (square x) (square y))

; In addition, we can also define a procedure `sum-of-squares` that, given any two numbers
; as arguments, produces the sum of their squares:

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 2 4) ; 20

; Now we can use `sum-of-squares` to build more procedures.

; Define the formula for calculating the distance between two points on the Cartesian plane,
; derived from the Pythagorean theorem.
; See: https://br.neurochispas.com/geometria/distancia-entre-dois-pontos-formula-e-exemplos/
(define (distance x_1 x_2 y_1 y_2)
  (sqrt
   (+ (square (- x_2 x_1))
      (square (- y_2 y_1)))))
