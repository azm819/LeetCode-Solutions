class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var fives = 0
        var cPow = 5
        while cPow <= n {
            fives += n / cPow
            cPow *= 5
        }
        return fives
    }
}

