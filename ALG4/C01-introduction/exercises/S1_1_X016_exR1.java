/*
 * File:          S1_1_X016_exR1.java
 * Author:        Miquéias Medeiros <https://github.com/miqu3iasg>
 * Created:       2026-10-25
 * Modified:      2026-10-25
 * Source:        Algorithm, 4th
 * By:            Robert Sedgewick, Kevin Wayne
 * Location:      p. 56
 *
 * Compilation:   $ javac S1_1_X016_exR1.java
 * Execution:     $ java S1_1_X016_exR1
 *
 * The statement of the exercise is the code below. My answer consist of my
 * line of reasoning, provided in the block comments bellow as well.
 *
 * References:
 *   - https://stackoverflow.com/questions/18368406/java-lang-stackoverflowerror-due-to-recursion
 *   - https://www.geeksforgeeks.org/java/recursion-in-java/
 *
 * SPDX-License-Identifier: AGPL-3.0-only
 * Copyright:     (c) 2026 Miquéias Medeiros <https://github.com/miqu3iasg>.
 */

public class S1_1_X016_exR1 {

    /*
     * 1.1.16 Give the value of exR1(6):
     */
    public static String exR1(int n) {
        /*
         * The idea for this statement would be decreasing the value of n until this
         * condition was valid, but this never happens, this condition is never satisfied
         * for the value 6.
         */
        if (n <= 0) return "";
        /*
         * This is a recursive function. The function call itself, but the value of
         * n never changes, because there's no assignment of any value, it is just
         * a infinite input manipulation.
         */
        return exR1(n - 3) + n + exR1(n - 2) + n;
    }

    /*
     * 1.1.17 Criticize the following recursive function:
     */
    public static String exR2(int n) {
        /*
         * The same thing happens here, but the condition is placed after the recursive
         * call and never returns anything. This is a inifite loop as well, even if the value
         * is not 6, because the execution never reaches the condition. In `exR1`, if the
         * given value was 0 for example, the function call would be ended, which would cause
         * a memory error at some point.
         */
        String s = exR2(n - 3) + n + exR2(n - 2) + n;
        if (n <= 0) return "";
        return s;
    }
}
