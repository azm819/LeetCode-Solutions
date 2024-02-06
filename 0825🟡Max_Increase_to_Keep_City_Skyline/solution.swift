class Solution {
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        var rowMax = Array(repeating: 0, count: grid.count)
        var colMax = Array(repeating: 0, count: grid[0].count)
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                rowMax[i] = max(rowMax[i], grid[i][j])
                colMax[j] = max(colMax[j], grid[i][j])
            }
        }

        var result = 0
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                result += min(rowMax[i], colMax[j]) - grid[i][j]
            }
        }
        return result
    }
}
