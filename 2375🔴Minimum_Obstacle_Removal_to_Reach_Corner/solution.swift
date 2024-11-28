class Solution {
    func minimumObstacles(_ grid: [[Int]]) -> Int {
        var curStep = 0
        var queue: [(i: Int, j: Int)] = [(0, 0)]
        var nextQueue: [(i: Int, j: Int)] = []
        var isVisited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        while let (i, j) = queue.popLast() {
            if i >= .zero && i < grid.count && j >= .zero && j < grid[i].count && !isVisited[i][j] {
                isVisited[i][j] = true

                if i == grid.count - 1 && j == grid[i].count - 1 {
                    return curStep + grid[i][j]
                }

                if grid[i][j] == .zero {
                    queue.append((i + 1, j))
                    queue.append((i - 1, j))
                    queue.append((i, j + 1))
                    queue.append((i, j - 1))
                } else {
                    nextQueue.append((i + 1, j))
                    nextQueue.append((i - 1, j))
                    nextQueue.append((i, j + 1))
                    nextQueue.append((i, j - 1))
                }
            }

            if queue.isEmpty {
                queue = nextQueue
                nextQueue = []
                curStep += 1
            }
        }

        fatalError()
    }
}
