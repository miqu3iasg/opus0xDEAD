; ▄▄▄▄ ▄▄  ▄▄  ▄▄▄  ▄▄ ▄▄ ▄▄▄▄▄ ▄▄  ▄▄▄▄  ▄▄▄▄  ▄▄▄▄
; ░█ ░█ ░█ ▄▄ ░█ ░█ ░█ ░█ ░█ ░█ ▄▄ ░█ ░█ ░█ ▀▀ ░█ ░█
; ▒█ ▒█ ▒█ ▒█ ▒█ ░█ ▒█ ░█   ▄▒█ ▒█ ▒█ ░█  ▀▀░▄ ▒█ ░█
; ▓▓ ▓▓ ▓▓ ▓▓ ▓▓ ▓░ ▓▓ ▓░ ▒░ ▓▓ ▓▓ ▓▓ ▓░ ░█ ▓░ ▀▀▀░█
; ▀▀ ▀▀ ▀▀ ▀▀  ▀▀▒█ ▀▀▀▀▀ ▀▀▀▀▀ ▀▀  ▀▀▀▀ ▀▀▀▀  ░█ ▓░
;                ▀▀                             ▀▀▀▀
; File:          C01-S1.1.2-P002_naming_and_enviroment.scm
; Author:        Miquéias Alves Medeiros <https://github.com/miqu3iasg>
; Created:       2026-09-17
; Modified:      2026-09-17
; By:            Harold Abelson, Gerald Jay Sussman, Julie Sussman
; Reference:     Structure and Interpretation of Computer Programs (SICP)
; Location:      pp. 10–11
;
; Introduction to naming computational objects with `define` in Scheme and the role
; of the environment in maintaining associations between names and values.
;
; SPDX-License-Identifier: AGPL-3.0-only
; Copyright:     (c) 2026 Miquéias Alves Medeiros <https://github.com/miqu3iasg>.


; In programming languages, we can assign names do computational objects. These names refer to
; variables that hold the value of this object. In the Scheme dialect of Lisp, we can declare
; variables using `define`, typing

(define size 2) ; This tells to the interpreter to associate the value 2 with the name `size`. e.g. size = 2

; Once it declared, we can refer to the value 2 by name and perform operations with it:

(* 5 size) ; 10

; More examples of the use of `define`:

; Defining the variables to perform the calculation
(define pi 3.14159)
(define radius 10)

; Here, we are calculating the area of the circle. We can perform a squaring operation
; by multiplying the radius variable by itself to obtain r².
(* pi (* radius radius)) ; 314.159

; We can get the circumference as well using the same idea. You can define a variable
; and assign their value by some calculation btw.
(define circumference (* 2 pi radius)) ; 62.8318

; Naming computational objects allow us to perform complex compound operations without
; trying to remember and repeat the details of the computational objetcs used in those
; operations. These objects may have very complex structures, and would be extremely
; tediuos having to remember all of that every time we used those structures. In addition,
; complex programs are created by building, step by step, computational objects of
; increasing complexity. The interpreter makes this gradual program construction particularly
; convenient, as associations between names and objects can be created incrementally across
; successive interactions. This feature encourages the incremental development and testing
; of programs and is largely responsible for the fact that a Lisp program typically consists
; of a large number of relatively simple procedures.

; Thus, it is clear that some form of memory is required for this association of values with
; symbols to be possible, and for those values to be retrievable. This memory is called an
; _environment_, more precisely, the _global environment_.
