class Solution {
    func largestLocal(_ grid: [[Int]]) -> [[Int]] {
        let n = grid.count
        var result = Array(repeating: Array(repeating: 0, count: n - 2), count: n - 2)
        for i in 1 ..< n - 1 {
            for j in 1 ..< n - 1 {
                result[i - 1][j - 1] = max(
                    grid[i - 1][j - 1], grid[i - 1][j], grid[i - 1][j + 1],
                    grid[i][j - 1], grid[i][j], grid[i][j + 1],
                    grid[i + 1][j - 1], grid[i + 1][j], grid[i + 1][j + 1]
                )
            }
        }
        return result
    }
}
