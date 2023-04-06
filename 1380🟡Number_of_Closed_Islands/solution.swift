class Solution {
    private func isClosed(
        _ grid: [[Int]],
        _ i: Int,
        _ j: Int,
        _ visited: inout [[Bool]]
    ) -> Bool {
        guard i >= .zero && i < grid.count && j >= .zero && j < grid[0].count else {
            return false
        }
        guard grid[i][j] == .zero else {
            return true
        }
        guard !visited[i][j] else {
            return true
        }
        visited[i][j] = true
        let neigh1 = isClosed(grid, i - 1, j, &visited)
        let neigh2 = isClosed(grid, i + 1, j, &visited)
        let neigh3 = isClosed(grid, i, j - 1, &visited)
        let neigh4 = isClosed(grid, i, j + 1, &visited)
        return neigh1 && neigh2 && neigh3 && neigh4
    }

    func closedIsland(_ grid: [[Int]]) -> Int {
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var result = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count where grid[i][j] == .zero && !visited[i][j] && isClosed(grid, i, j, &visited) {
                result += 1
            }
        }
        return result
    }
}
