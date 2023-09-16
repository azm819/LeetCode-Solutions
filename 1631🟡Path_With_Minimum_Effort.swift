class Solution {
    private func checkEffort(
        _ prev: Int,
        _ i: Int,
        _ j: Int,
        _ effort: Int,
        _ heights: [[Int]],
        _ visited: inout [[Bool]]
    ) -> Bool {
        guard i >= .zero && i < heights.count &&
              j >= .zero && j < heights[0].count &&
              !visited[i][j] &&
              abs(prev - heights[i][j]) <= effort else {
            return false
        }
        visited[i][j] = true
        if i == heights.count - 1 && j == heights[0].count - 1 {
            return true
        }
        return checkEffort(heights[i][j], i - 1, j, effort, heights, &visited) ||
            checkEffort(heights[i][j], i + 1, j, effort, heights, &visited) ||
            checkEffort(heights[i][j], i, j - 1, effort, heights, &visited) ||
            checkEffort(heights[i][j], i, j + 1, effort, heights, &visited)
    }

    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        var l = 0
        var r = 1_000_000
        while l < r {
            let c = (l + r) / 2
            var visited = Array(repeating: Array(repeating: false, count: heights[0].count), count: heights.count)
            if checkEffort(heights[0][0], 0, 0, c, heights, &visited) {
                r = c
            } else {
                l = c + 1
            }
        }
        return l
    }
}
