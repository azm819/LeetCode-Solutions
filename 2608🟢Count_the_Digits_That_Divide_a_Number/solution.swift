class Solution {
    func countDigits(_ num: Int) -> Int {
        var digits = num
        var result = 0
        while digits != .zero {
            if num % (digits % 10) == .zero {
                result += 1
            }
            digits /= 10
        }
        return result
    }
}
