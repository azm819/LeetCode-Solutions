class Solution {
    func minEnd(_ n: Int, _ x: Int) -> Int {
        var result = x
        var n = n - 1
        var bit = 1
        while n > .zero {
            while bit & x != .zero {
                bit *= 2
            }

            if n % 2 == 1 {
                result |= bit
            }
            bit *= 2
            n /= 2
        }

        return result
    }
}

