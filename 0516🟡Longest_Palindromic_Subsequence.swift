class Solution {
    private func dp(_ s: [Character], _ i: Int, _ j: Int, _ memo: inout [[Int?]]) -> Int {
        guard i != j else { return 1 }
        guard i < j else { return .zero }
        if let mem = memo[i][j] { return mem }
        let res: Int
        if s[i] == s[j] {
            res = 2 + dp(s, i + 1, j - 1, &memo)
        } else {
            res = max(dp(s, i, j - 1, &memo), dp(s, i + 1, j, &memo))
        }
        memo[i][j] = res
        return res
    }

    func longestPalindromeSubseq(_ s: String) -> Int {
        var memo = Array(repeating: Array(repeating: Optional<Int>.none, count: s.count), count: s.count)
        return dp(Array(s), 0, s.count - 1, &memo)
    }
}
