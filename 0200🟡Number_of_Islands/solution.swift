class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var result = 0
        for i in 0..<n {
            for j in 0..<m {
                if visited[i][j] { continue }
                if grid[i][j] == "1" {
                    result += 1
                    var queue = [(i, j)]
                    while !queue.isEmpty {
                        let (x, y) = queue.popLast()!
                        if visited[x][y] { continue }
                        if x > 0 && grid[x - 1][y] == "1" {
                            queue.append((x - 1, y))
                        }
                        if x < n - 1 && grid[x + 1][y] == "1" {
                            queue.append((x + 1, y))
                        }
                        if y > 0 && grid[x][y - 1] == "1" {
                            queue.append((x, y - 1))
                        }
                        if y < m - 1 && grid[x][y + 1] == "1" {
                            queue.append((x, y + 1))
                        }
                        visited[x][y] = true
                    }
                }
                visited[i][j] = true
            }
        }
        return result
    }
}
