class Solution {
    private func dp(
        _ i: Int,
        _ prevJ: Int,
        _ grid: [[Int]],
        _ memo: inout [[Int?]]
    ) -> Int {
        guard i < grid.count else { return .zero }

        if prevJ != -1, let mem = memo[i][prevJ] {
            return mem
        }

        var result: Int = .max
        for j in 0 ..< grid[i].count where j != prevJ {
            result = min(result, grid[i][j] + dp(i + 1, j, grid, &memo))
        }

        if prevJ != -1 {
            memo[i][prevJ] = result
        }

        return result
    }

    func minFallingPathSum(_ grid: [[Int]]) -> Int {
        var memo = Array(repeating: Array(repeating: Int?.none, count: grid.count), count: grid.count)
        return dp(.zero, -1, grid, &memo)
    }
}
