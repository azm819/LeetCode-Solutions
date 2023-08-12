class Solution {
    private func dp(
        _ i: Int,
        _ j: Int,
        _ obstacleGrid: [[Int]],
        _ memo: inout [[Int?]]
    ) -> Int {
        guard i < obstacleGrid.count && j < obstacleGrid[0].count && obstacleGrid[i][j] != 1 else {
            return .zero
        }
        guard i != obstacleGrid.count - 1 || j != obstacleGrid[0].count - 1 else {
            return 1
        }
        if let mem = memo[i][j] {
            return mem
        }
        let result = dp(i + 1, j, obstacleGrid, &memo) + dp(i, j + 1, obstacleGrid, &memo)
        memo[i][j] = result
        return result
    }

    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var memo = Array(repeating: Array(repeating: Optional<Int>.none, count: obstacleGrid[0].count), count: obstacleGrid.count)
        return dp(.zero, .zero, obstacleGrid, &memo)
    }
}
