class Solution {
    func maxMoves(_ grid: [[Int]]) -> Int {
        var reachability = Array(repeating: true, count: grid.count)
        for j in 1 ..< grid[0].count {
            var newReachability = Array(repeating: false, count: grid.count)
            var isReachable = false
            for i in 0 ..< grid.count {
                newReachability[i] = i > .zero && reachability[i - 1] && grid[i][j] > grid[i - 1][j - 1] ||
                    reachability[i] && grid[i][j] > grid[i][j - 1] ||
                    i < grid.count - 1 && reachability[i + 1] && grid[i][j] > grid[i + 1][j - 1]
                isReachable = isReachable || newReachability[i]
            }
            if !isReachable {
                return j - 1
            }
            reachability = newReachability
        }

        return grid[0].count - 1
    }
}
