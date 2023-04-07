class Solution {
    func numEnclaves(_ grid: [[Int]]) -> Int {
        let n = grid.count - 1
        let m = grid[0].count - 1
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var result = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count where grid[i][j] == 1 {
                result += 1
            }
        }
        var queue = [(Int, Int)]()
        for i in 0...n {
            if grid[i][0] == 1 {
                visited[i][0] = true
                queue.append((i, 0))
            }
            if m > 0 && grid[i][m] == 1 {
                visited[i][m] = true
                queue.append((i, m))
            }
        }
        if m > 1 {
            for j in 1...m - 1 {
                if grid[0][j] == 1 {
                    visited[0][j] = true
                    queue.append((0, j))
                }
                if n > 0 && grid[n][j] == 1 {
                    visited[n][j] = true
                    queue.append((n, j))
                }
            }
        }
        while let (i, j) = queue.popLast() {
            result -= 1
            if i > 0 && grid[i - 1][j] == 1 && !visited[i - 1][j] {
                visited[i - 1][j] = true
                queue.append((i - 1, j))
            }
            if i < n && grid[i + 1][j] == 1 && !visited[i + 1][j] {
                visited[i + 1][j] = true
                queue.append((i + 1, j))
            }
            if j > 0 && grid[i][j - 1] == 1 && !visited[i][j - 1] {
                visited[i][j - 1] = true
                queue.append((i, j - 1))
            }
            if j < m && grid[i][j + 1] == 1 && !visited[i][j + 1] {
                visited[i][j + 1] = true
                queue.append((i, j + 1))
            }
        }
        return result
    }
}
