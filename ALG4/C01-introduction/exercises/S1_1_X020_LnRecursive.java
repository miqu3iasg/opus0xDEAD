/*
 * File:          S1_1_X020_LnRecursive.java
 * Author:        Miquéias Medeiros <https://github.com/miqu3iasg>
 * Created:       2026-10-28
 * Modified:      2026-10-29
 * Source:        Algorithm, 4th
 * By:            Robert Sedgewick, Kevin Wayne
 * Location:      p. 58
 *
 * Compilation:   $ javac S1_1_X020_LnRecursive.java
 * Execution:     $ java S1_1_X020_LnRecursive <integer>
 *
 * 1.1.20 Write a recursive static method that computes the value of ln (N!).
 *
 * References:
 *   - https://en.wikipedia.org/wiki/Factorial
 *   - https://mathworld.wolfram.com/Logarithm.html
 *   - https://docs.oracle.com/javase/8/docs/api/java/lang/Math.html
 *
 * SPDX-License-Identifier: AGPL-3.0-only
 * Copyright:     (c) 2026 Miquéias Medeiros <https://github.com/miqu3iasg>.
 */

public class S1_1_X020_LnRecursive {

    /**
     * Calculates the natural logarithm of the factorial of a given number.
     * The calculation uses the logarithmic property that allows the logarithm
     * of a product to be expressed as the sum of the logarithms of its factors.
     *
     * @param n The number whose factorial's natural logarithm will be calculated.
     * @return The natural logarithm of {@code n!}.
     */
    public static double lnFactorial(int n) {
        /*
         * Seems that to calculate a natural logarithm of a factorial number N,
         * we need first define what is a factorial number, and apply this definition
         * to the natural logarithm formula.
         *
         * So, N! can be defined as:
         *
         * N! = N x (N - 1)! => N x (N - 1) x (N - 2) x (N - 3) x ... x 3 x 2 x 1.
         *
         * See: https://en.wikipedia.org/wiki/Factorial
         *
         * Since ln share the same mathematical properties as standard logarithms, we
         * can use them to derivate some solution. We know that:
         *
         * ln(ab) = ln(a) + ln(b)
         *
         * and then we can change a and b to the definition of our factorial N:
         *
         * ln(N!) = ln(N x (N - 1)!)
         *
         * and using the given logarithm propertie, we reach that solution:
         *
         * ln(N!) = ln(N) + ln((N - 1)!).
         *
         * See: https://mathworld.wolfram.com/Logarithm.html, Equation (6).
         *
         * I don't need to calculate ln manually, because the function Math.log return
         * the natural logarithm already. So we just need to pass the factorial along.
         *
         * See: https://docs.oracle.com/javase/8/docs/api/java/lang/Math.html
         */

        if (n <= 1) return 0; // ln(1!) = ln(1) = 0

        /*
         * Here, I don't need to apply Math.log to the second term because calling this
         * function recursively (inside itself) with n - 1 as an argument already takes care
         * of it.
         */
        return Math.log(n) + lnFactorial(n - 1);
    }

    public static void main(String[] args) {
        int N = Integer.parseInt(args[0]);
        System.out.printf("ln(%d!) = %.6f%n", N, lnFactorial(N));
    }
}
