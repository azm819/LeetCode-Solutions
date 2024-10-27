class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        var dp = Array(repeating: Array(repeating: Int.zero, count: matrix[0].count + 1), count: matrix.count + 1)

        var result: Int = .zero
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count where matrix[i][j] == 1 {
                dp[i + 1][j + 1] = min(dp[i][j + 1], dp[i + 1][j], dp[i][j]) + 1
                result += dp[i + 1][j + 1]
            }
        }
        return result
    }
}
