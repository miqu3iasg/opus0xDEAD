/*
 * File:          S1_1_X024_EuclidsAlgorithm.java
 * Author:        Miquéias Medeiros <https://github.com/miqu3iasg>
 * Created:       2026-10-25
 * Modified:      2026-10-25
 * Source:        Algorithm, 4th
 * By:            Robert Sedgewick, Kevin Wayne
 * Location:      p. 58
 *
 * Compilation:   $ javac S1_1_X024_EuclidsAlgorithm.java
 * Execution:     $ java S1_1_X024_EuclidsAlgorithm 105 24
 *
 * 1.1.24 Give the sequence of values of p and q that are computed when Euclid’s
 * algorithm is used to compute the greatest common divisor of 105 and 24. Extend
 * the code given on page 4 to develop a program Euclid that takes two integers
 * from the command line and computes their greatest common divisor, printing out
 * the two arguments for each call on the recursive method. Use your program to
 * compute the greatest common divisor or 1111111 and 1234567.
 *
 * References:
 *   - https://www.cs.emory.edu/~cheung/Courses/170/Syllabus/09/command-args.html
 *   - https://stackoverflow.com/questions/41780775/how-to-write-command-line-arguments-and-how-to-covert-string-to-int-in-java
 *   - https://www.vogella.com/tutorials/JavaAlgorithmsEuclid/article.html
 *   - https://www.cs.yale.edu/homes/aspnes/pinewiki/EuclidsAlgorithm.html?highlight=%28CategoryAlgorithmNotes%29
 *
 * SPDX-License-Identifier: AGPL-3.0-only
 * Copyright:     (c) 2026 Miquéias Medeiros <https://github.com/miqu3iasg>.
 */

public class S1_1_X024_EuclidsAlgorithm {

    /**
     * Computes the greatest common divisor of two integers using Euclid's algorithm.
     *
     * @param p the dividend and current first operand of the Euclidean algorithm
     * @param q the divisor and current second operand of the Euclidean algorithm
     * @return the greatest common divisor of p and q
     */
    public static int gcd(int p, int q) {
        System.out.println("p = " + p + ", q = " + q);
        if (q == 0) return p;
        int r = p % q;
        return gcd(q, r);
    }

    public static void main(String[] args) {
        /*
         * First argument is stored in args[0], and the second argument is stored
         * in args[1]
         */
        int p = Integer.parseInt(args[0]);
        int q = Integer.parseInt(args[1]);

        System.out.println("MDC = " + gcd(p, q));
    }
}
