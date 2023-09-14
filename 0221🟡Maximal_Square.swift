class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var result = 0
        var dp = Array(repeating: 0, count: matrix[0].count)

        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[0].count {
                if matrix[i][j] == "1" {
                    dp[j] = min(j > .zero ? dp[j - 1] : .zero, dp[j])
                    if matrix[i - dp[j]][j - dp[j]] == "1" {
                        dp[j] += 1
                    }
                    result = max(result, dp[j])
                } else {
                    dp[j] = .zero
                }
            }
        }

        return result * result
    }
}
