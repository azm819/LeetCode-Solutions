class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let n = grid.count
        guard grid[n - 1][n - 1] == .zero else { return -1 }
        var notVisited = Array(repeating: Array(repeating: true, count: n), count: n)
        var dist = 0
        var queue = [(n - 1, n - 1)]
        notVisited[n - 1][n - 1] = false
        let proccess: (Int, Int) -> Bool = { i, j in
            guard i >= .zero && i < n && j >= .zero && j < n else { return false }
            guard grid[i][j] == .zero else { return false }
            guard notVisited[i][j] else { return false }
            notVisited[i][j] = false
            return true
        }
        while !queue.isEmpty {
            dist += 1
            var newQueue = [(Int, Int)]()
            while let (i, j) = queue.popLast() {
                if i == .zero && j == .zero {
                    return dist
                }
                [
                    (i - 1, j - 1),
                    (i - 1, j),
                    (i, j - 1),
                    (i - 1, j + 1),
                    (i + 1, j - 1),
                    (i, j + 1),
                    (i + 1, j),
                    (i + 1, j + 1),
                ].forEach {
                    if proccess($0.0, $0.1) {
                        newQueue.append(($0.0, $0.1))
                    }
                }
            }
            queue = newQueue
        }
        return -1
    }
}

