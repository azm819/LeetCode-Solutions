class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var res = 0
        var n = n
        while n > .zero {
            res += n % 2
            n /= 2
        }
        return res
    }
}
