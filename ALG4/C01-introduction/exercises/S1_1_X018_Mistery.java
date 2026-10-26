/*
 * File:          S1_1_X018_Mistery.java
 * Author:        Miquéias Medeiros <https://github.com/miqu3iasg>
 * Created:       2026-10-25
 * Modified:      2026-10-25
 * Source:        Algorithm, 4th
 * By:            Robert Sedgewick, Kevin Wayne
 * Location:      p. 57
 *
 * Compilation:   $ javac S1_1_X018_Mistery.java
 * Execution:     $ java S1_1_X018_Mistery
 *
 * The statement of the exercise is the code below. My answer consist of my
 * line of reasoning, provided in the block comments bellow as well.
 *
 * References:
 *   - S1_1_X016_exR1.java
 *   - https://cs.yale.edu/homes/aspnes/pinewiki/RussianPeasantsAlgorithm.html
 *   - https://en.wikipedia.org/wiki/Exponentiation_by_squaring
 *
 * SPDX-License-Identifier: AGPL-3.0-only
 * Copyright:     (c) 2026 Miquéias Medeiros <https://github.com/miqu3iasg>.
 */

public class S1_1_X018_Mistery {

    /*
     * 1.1.18 Consider the following recursive function. What are the values of
     * mystery(2, 25) and mystery(3, 11)? Given positive integers a and b, describe
     * what value mystery(a, b) computes. Answer the same question, but replace +
     * with * and replace return 0 with return 1.
     */
    public static int mystery(int a, int b) {
        /*
         * Considering a = 2 and b = 25 for the first case, we land on the final
         * recursive call at the return statement, and then, the mistery function
         * calls itself with the values a = 4 and b = 12 (the division returns a float,
         * but since the parameter requires an int, the number is truncated). At the
         * function call, we fell into in the first recursive call, at the middle of
         * the function, because it satifies the given condition, and then the mistery
         * function calls itself again, but with the values a = 8 and b = 6. From this
         * I can see that the value b tends for zero, while the value of a doubles with
         * each recursive call. At some point, the value of b will satisfy the first
         * condition, and the mistery function will return 0.
         *
         * Considering a = 3 and b = 11, we will have a very similar result. The value of a
         * will double with each recursive call, and the value of b will tend toward zero,
         * until at some point the first condition is satisfied. If we replace the addition
         * operator (+) with the multiplicaiton operator (*) and replace return 0 to
         * return 1, just the result will be changed, but the behavior of the function
         * will be same, since only the value of b determines when the recursive call begins
         * (because the conditions consider only their value), and in every call its value
         * is always reduced by half, it eventually reaches zero, satisfying the given
         * condition in the begin of the function scope. The only difference would be that
         * instead of returning zero, the function would return one.
         */
        if (b == 0) return 0;
        if (b % 2 == 0) return mystery(a + a, b / 2);
        return mystery(a + a, b / 2) + a;
    }

    /*
     * While tracing the recursion, I realized my earlier reasoning was wrong: when a
     * call reaches b == 0 and returns 0, the function doesn't simply end there. That 0
     * is only the return value of the deepest call, and every call before this is
     * still waiting with a pending operation that is resolved on the way back. With
     * that in mind, mistery(2,25) actually returns 50 and mistery(3, 11) returns 33.
     * For positive integers a and b, mistery(a, b) = a * b. This happens because b is
     * halved in every call, so at some point it always reaches 0, while a is doubled
     * in every call. Whenever b is odd, the halving leaves one extra a behind, which
     * is added by the + a in the last return statement (when b is even, nothing is added
     * in that step). By repeating this until b reaches 0, the sum of all the leftover a
     * values, each one already doubled by the previous calls, is exactly the product.
     * For example, mystery(2, 3) = mystery(4, 1) + 2 = (mystery(8, 0) + 4) + 2 = 0 + 4 + 2 = 6.
     * If we replace the addition operators with multiplication and change the return value
     * of the first condition to 1, the result is that mystery(a, b) = a^b: now a is squared
     * in every call instead of doubled, and when b is odd the result is multiplied by a
     * instead of added to it. The base case must return 1 because multiplying by 1 changes
     * nothing, just as adding 0 changes nothing. So instead of a sum of leftover values,
     * the function builds a product of them, and the result grows exponentially with b.
     */
}
