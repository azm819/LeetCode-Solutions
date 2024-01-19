class Solution {
    private func dp(
        _ i: Int,
        _ j: Int,
        _ matrix: [[Int]],
        _ memo: inout [[Int?]]
    ) -> Int {
        guard j >= .zero && j < matrix.count else {
            return 1_000_001
        }
        guard i < matrix.count else {
            return .zero
        }

        if let mem = memo[i][j] {
            return mem
        }
        let result = matrix[i][j] + min(
            dp(i + 1, j - 1, matrix, &memo),
            dp(i + 1, j, matrix, &memo),
            dp(i + 1, j + 1, matrix, &memo)
        )
        memo[i][j] = result
        return result
    }

    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var memo = Array(repeating: Array(repeating: Int?.none, count: matrix.count), count: matrix.count)
        var result: Int = .max
        for i in 0 ..< matrix.count {
            result = min(result, dp(.zero, i, matrix, &memo))
        }
        return result
    }
}
