class Solution {
    private func checkReachability(_ i: Int, _ j: Int, _ factor: Int, _ safenessFactor: [[Int]], _ visited: inout [[Bool]]) -> Bool {
        guard i >= .zero && i < safenessFactor.count &&
                j >= .zero && j < safenessFactor[i].count &&
                !visited[i][j] && safenessFactor[i][j] >= factor else {
            return false
        }

        if i == safenessFactor.count - 1 && j == safenessFactor[i].count - 1 {
            return true
        }

        visited[i][j] = true

        return checkReachability(i + 1, j, factor, safenessFactor, &visited) ||
            checkReachability(i - 1, j, factor, safenessFactor, &visited) ||
            checkReachability(i, j + 1, factor, safenessFactor, &visited) ||
            checkReachability(i, j - 1, factor, safenessFactor, &visited)
    }

    func maximumSafenessFactor(_ grid: [[Int]]) -> Int {
        var safenessFactor = Array(repeating: Array(repeating: Int.max, count: grid[0].count), count: grid.count)
        var queue: [(i: Int, j: Int)] = []
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[i].count where grid[i][j] == 1 {
                queue.append((i, j))
            }
        }
        var factor = 0
        while !queue.isEmpty {
            var newQueue: [(i: Int, j: Int)] = []
            for cell in queue where safenessFactor[cell.i][cell.j] > factor {
                safenessFactor[cell.i][cell.j] = factor

                if cell.i > 0 {
                    newQueue.append((cell.i - 1, cell.j))
                }
                if cell.i < grid.count - 1 {
                    newQueue.append((cell.i + 1, cell.j))
                }
                if cell.j > 0 {
                    newQueue.append((cell.i, cell.j - 1))
                }
                if cell.j < grid[cell.i].count - 1 {
                    newQueue.append((cell.i, cell.j + 1))
                }
            }

            queue = newQueue
            factor += 1
        }

        var l = 0
        var r = factor - 1
        while l < r {
            let c = (l + r + 1) / 2
            var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
            if checkReachability(.zero, .zero, c, safenessFactor, &visited) {
                l = c
            } else {
                r = c - 1
            }
        }
        return l
    }
}
