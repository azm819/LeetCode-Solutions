class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        guard n > .zero && n & (n - 1) == .zero else { return false }
        var n = n
        var count = 0
        while n > 1 {
            n >>= 1
            count += 1
        }
        return count % 2 == .zero
    }
}
