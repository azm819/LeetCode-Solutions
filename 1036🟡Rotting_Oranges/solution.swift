class Solution {
    private func dfs(_ grid: [[Int]], _ i: Int, _ j: Int, _ dists: inout [[Int]], _ curD: Int) {
        guard i >= .zero && i < grid.count && j >= .zero && j < grid[0].count else { return }
        guard grid[i][j] != .zero else { return }
        guard dists[i][j] > curD else { return }
        if grid[i][j] == 1 {
            dists[i][j] = curD
            dfs(grid, i + 1, j, &dists, curD + 1)
            dfs(grid, i - 1, j, &dists, curD + 1)
            dfs(grid, i, j + 1, &dists, curD + 1)
            dfs(grid, i, j - 1, &dists, curD + 1)
        } else {
            dists[i][j] = .zero
            dfs(grid, i + 1, j, &dists, 1)
            dfs(grid, i - 1, j, &dists, 1)
            dfs(grid, i, j + 1, &dists, 1)
            dfs(grid, i, j - 1, &dists, 1)
        }
    }

    func orangesRotting(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var dists = Array(repeating: Array(repeating: Int.max, count: m), count: n)
        for i in 0..<n {
            for j in 0..<m {
                if grid[i][j] == 2 {
                    dfs(grid, i, j, &dists, .zero)
                }
            }
        }
        var result = 0
        for i in 0..<n {
            for j in 0..<m {
                if grid[i][j] == 1 && dists[i][j] > result {
                    result = dists[i][j]
                }
            }
        }
        return result == .max ? -1 : result
    }
}
