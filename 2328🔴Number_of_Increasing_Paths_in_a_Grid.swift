class Solution {
    private func dfs(
        _ prev: Int,
        _ i: Int,
        _ j: Int,
        _ grid: [[Int]],
        _ memo: inout [[Int?]]
    ) -> Int {
        guard i >= .zero && i < grid.count && j >= .zero && j < grid[0].count else { return .zero }
        guard grid[i][j] > prev else { return .zero }
        if let subRes = memo[i][j] {
            return subRes
        }
        var subRes = 1
        subRes += dfs(grid[i][j], i + 1, j, grid, &memo)
        subRes %= 1_000_000_007
        subRes += dfs(grid[i][j], i - 1, j, grid, &memo)
        subRes %= 1_000_000_007
        subRes += dfs(grid[i][j], i, j + 1, grid, &memo)
        subRes %= 1_000_000_007
        subRes += dfs(grid[i][j], i, j - 1, grid, &memo)
        subRes %= 1_000_000_007
        memo[i][j] = subRes
        return subRes
    }

    func countPaths(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var memo = Array(repeating: Array(repeating: Optional<Int>.none, count: m), count: n)
        var result = 0
        for i in 0..<n {
            for j in 0..<m {
                result += dfs(.zero, i, j, grid, &memo)
                result %= 1_000_000_007
            }
        }
        return result
    }
}
