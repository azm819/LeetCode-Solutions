class Solution {
    func reverseBits(_ n: Int) -> Int {
        var result = 0
        var n = n
        var count = 0
        while n > .zero {
            count += 1
            result *= 2
            result += n % 2
            n /= 2
        }
        while count < 32 {
            count += 1
            result *= 2
        }
        return result
    }
}
