class Solution {
    private func dfs(
        _ grid: [[Int]],
        _ i: Int,
        _ j: Int,
        _ curD: Int,
        _ dist: inout [[Int]]
    ) {
        guard dist[i][j] == -1 || curD < dist[i][j] else {
            return
        }
        dist[i][j] = grid[i][j] == .zero ? curD : .zero
        if i > .zero {
            dfs(grid, i - 1, j, dist[i][j] + 1, &dist)
            if j > .zero {
                dfs(grid, i - 1, j - 1, dist[i][j] + 2, &dist)
            }
            if j < grid[0].count - 1 {
                dfs(grid, i - 1, j + 1, dist[i][j] + 2, &dist)
            }
        }
        if i < grid.count - 1 {
            dfs(grid, i + 1, j, dist[i][j] + 1, &dist)
            if j > .zero {
                dfs(grid, i + 1, j - 1, dist[i][j] + 2, &dist)
            }
            if j < grid[0].count - 1 {
                dfs(grid, i + 1, j + 1, dist[i][j] + 2, &dist)
            }
        }
        if j > .zero {
            dfs(grid, i, j - 1, dist[i][j] + 1, &dist)
        }
        if j < grid[0].count - 1 {
            dfs(grid, i, j + 1, dist[i][j] + 1, &dist)
        }
    }

    func maxDistance(_ grid: [[Int]]) -> Int {
        var dist = Array(repeating: Array(repeating: -1, count: grid[0].count), count: grid.count)
        var flag = false
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    dfs(grid, i, j, .zero, &dist)
                    flag = true
                    break
                }
            }
            if flag { break }
        }
        var result = -1
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == .zero && (result == -1 || result < dist[i][j]) {
                    result = dist[i][j]
                }
            }
        }
        return result
    }
}
