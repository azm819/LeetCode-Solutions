/** 
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return 	     -1 if num is higher than the picked number
 *			      1 if num is lower than the picked number
 *               otherwise return 0 
 * func guess(_ num: Int) -> Int 
 */

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var l = 1
        var r = n
        while l < r {
            let c = (l + r) / 2
            switch guess(c) {
            case -1:
                r = c - 1
            case 1:
                l = c + 1
            default:
                return c
            }
        }
        return l
    }
}
