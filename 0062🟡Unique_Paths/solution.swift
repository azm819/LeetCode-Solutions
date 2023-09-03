class Solution {
    private func dp(
        _ i: Int,
        _ j: Int,
        _ memo: inout [[Int?]]
    ) -> Int {
        guard i < memo.count && j < memo[0].count else {
            return .zero
        }
        if let mem = memo[i][j] {
            return mem
        }
        let result = dp(i + 1, j, &memo) + dp(i, j + 1, &memo)
        memo[i][j] = result
        return result
    }

    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var memo = Array(repeating: Array(repeating: Optional<Int>.none, count: m), count: n)
        memo[n - 1][m - 1] = 1
        return dp(.zero, .zero, &memo)
    }
}

