class Solution {
    private func isScramble(
        _ s1: [Character],
        _ s2: [Character],
        _ from1: Int,
        _ from2: Int,
        _ length: Int,
        _ dp: inout [[[Bool?]]]
    ) -> Bool {
        if let result = dp[from1][from2][length] {
            return result
        }
        guard length > 1 else {
            let result = s1[from1] == s2[from2]
            dp[from1][from2][length] = result
            return result
        }
        for newLen in 1..<length {
            let secLen = length - newLen
            if isScramble(s1, s2, from1, from2, newLen, &dp) && isScramble(s1, s2, from1 + newLen, from2 + newLen, secLen, &dp) ||
               isScramble(s1, s2, from1, from2 + secLen, newLen, &dp) && isScramble(s1, s2, from1 + newLen, from2, secLen, &dp) {
                dp[from1][from2][length] = true
                return true
            }
        }
        dp[from1][from2][length] = false
        return false
    }

    func isScramble(_ s1: String, _ s2: String) -> Bool {
        var length = s1.count
        var dp = Array(repeating: Array(repeating: Array(repeating: Optional<Bool>.none, count: length + 1), count: length), count: length)
        return isScramble(Array(s1), Array(s2), .zero, .zero, length, &dp)
    }
}
