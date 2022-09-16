class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let n = grid[0].count
        let m = grid.count
        var visited = Array<Array<Bool>>(repeating: .init(repeating: false, count: n), count: m)
        var result = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "0" {
                    visited[i][j] = true
                    continue
                }
                if !visited[i][j] {
                    result += 1
                    var queue = [(Int, Int)]()
                    queue.append((i, j))
                    while !queue.isEmpty {
                        let e = queue.popLast()!
                        visited[e.0][e.1] = true

                        if e.0 > 0 {
                            let f = e.0 - 1
                            if !visited[f][e.1] && grid[f][e.1] == "1" {
                                queue.append((f, e.1))
                            }
                        }

                        if e.0 < m - 1 {
                            let f = e.0 + 1
                            if !visited[f][e.1] && grid[f][e.1] == "1" {
                                queue.append((f, e.1))
                            }
                        }

                        if e.1 > 0 {
                            let s = e.1 - 1
                            if !visited[e.0][s] && grid[e.0][s] == "1" {
                                queue.append((e.0, s))
                            }
                        }

                        if e.1 < n - 1 {
                            let s = e.1 + 1
                            if !visited[e.0][s] && grid[e.0][s] == "1" {
                                queue.append((e.0, s))
                            }
                        }
                    }
                }
            }
        }
        return result
    }
}
