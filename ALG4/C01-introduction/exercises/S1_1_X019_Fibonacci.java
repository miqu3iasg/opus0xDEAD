/*
 * File:          S1_1_X019_Fibonacci.java
 * Author:        Miquéias Medeiros <https://github.com/miqu3iasg>
 * Created:       2026-10-27
 * Modified:      2026-10-27
 * Source:        Algorithm, 4th
 * By:            Robert Sedgewick, Kevin Wayne
 * Location:      p. 57
 *
 * Compilation:   $ javac -d out S1_1_X019_Fibonacci.java
 * Execution:     $ java S1_1_X019_Fibonacci
 *
 * 1.1.19 Run the following program on your computer. What is the largest value
 * of N for which this program takes less 1 hour to compute the value of F(N)?
 * Develop a better implementation of F(N) that saves computed values in an array.
 *
 * public class Fibonacci {
 *     public static long F(int N) {
 *         if (N == 0) return 0;
 *         if (N == 1) return 1;
 *         return F(N - 1) + F(N - 2);
 *     }
 *
 *     public static void main(String[] args) {
 *         for (int N = 0; N < 100; N++) {
 *             StdOut.println(N + " " + F(N));
 *         }
 *     }
 * }
 *
 * References:
 *   - https://stackoverflow.com/questions/180158/how-do-i-time-a-methods-execution-in-java
 *   - https://www.geeksforgeeks.org/dsa/time-complexity-recursive-fibonacci-program/
 *   - https://www.cs.cornell.edu/courses/cs3110/2009sp/recitations/rec19.html
 *   - https://stackoverflow.com/questions/16893682/calculating-time-complexities-of-algorithms-practically
 *   - https://introcs.cs.princeton.edu/java/41analysis/
 *
 * SPDX-License-Identifier: AGPL-3.0-only
 * Copyright:     (c) 2026 Miquéias Medeiros <https://github.com/miqu3iasg>.
 */
import java.util.*;

public class S1_1_X019_Fibonacci {
    /**
     * Computes the N-th number in the Fibonacci sequence using an array to store
     * previously calculated values.
     *
     * @param N the index of the Fibonacci number to calculate, where F(0) = 0 and F(1) = 1
     * @return the N-th Fibonacci number
     */
    public static long F(int N) {
        /*
         We have a Fibonacci sequence here, where each number is derived from the sum of
         the last two numbers, it grows exponentially O(2^n).
        */
        long[] fib = new long[N + 1];

        /*
        The first number of a Fibonacci sequence is always zero. Because of that, I didn't any kind of
        validation here.
        */
        fib[0] = 0;

        if (N == 1) fib[1] = 1;

        /*
        I start with index two (i = 2) because the last two positions have had already occupied by the
        first numbers of Fibonacci sequence.
        */
        for (int i = 2; i <= N; i++) {
            /*
            Here I abstract the Fibonacci algorithm itself, but using the array accessing specific
            memory positions.
            */
            fib[i] = fib[i - 1] + fib[i + 2];
        }

        return fib[N];
    }

    public static void main(String[] args) {

        /*
        Fibonacci values grow exponentially, and the execution time of the
        naive recursive algorithm also grows exponentially. However, the time
        does not grow proportionally to the Fibonacci values in a strict mathematical
        sense. The measurements are affected by system overhead and measurement
        variability, so I cannot precisely predict how long the operation will last
        and calculate a number based on that. I need to think about it in a different
        way.

        I've got a new information: "We know that the recursive equation for Fibonacci
        is = T(n-1) + T(n-2) + O(1). What this means is, the time taken to calculate fib(n)
        is equal to the sum of time taken to calculate fib(n-1) and fib(n-2). This also
        includes the constant time to perform the previous addition. On solving the above
        recursive equation we get the upper bound of Fibonacci as O(2n) but this is not the
        tight upper bound." The most important information here is that the time varies
        depending on the machine, so it is not a extremely accurate result, and it also
        give us the time-growth relationship in algorithms with exponential duration and
        execution, tipically O(2^n): T(n) = O((1+√5)/2)^n.

        See: https://www.geeksforgeeks.org/dsa/time-complexity-recursive-fibonacci-program/
        */

        /* NOTE: this code need to be commented so the maximum value of N can be calculated.*/
        for (int N = 0; N < 100; N++) {
            long start = System.nanoTime();
            System.out.println(N + " " + F(N)); // Process execution
            long end = System.nanoTime();
            double duration = (end - start) / 1_000_000.0;

            System.out.printf("The time taken to calculate F(%d) is %.3f ms%n", N, duration);
        }

        /*
        Executing the program, I found this result: "The time taken to calculate F(46) is 8570.574ms".
        This was the last line of execution before I stop it (because the time taken was very long),
        so it'll be our starting point.
        */
        double measuredTime = 8570.574; // F(46) in milliseconds
        int N = 46;
        double timeLimit = 3_600_000.0; // One hour, in milliseconds
        double growthRate =
                (1 + Math.sqrt(5)) / 2; // provided by the article above, this is our T(n)

        /*
        We don't raise growthRate to N because measuredTime already represents the execution
        time for F(46). Instead, we multiply it by growthRate once for each increment of N,
        estimating the execution time relative to F(46), rather than calculating it from the
        starting point n = 0.
        */
        while (measuredTime <= timeLimit) {
            measuredTime *= growthRate;
            N++;
        }

        /*
        The loop increments N once more after exceeding the time limit, so we subtract 1 to
        get the last N within the limit.
        */
        int maxN = N - 1;
        System.out.println("Estimated maximum N: " + maxN);
    }
}
