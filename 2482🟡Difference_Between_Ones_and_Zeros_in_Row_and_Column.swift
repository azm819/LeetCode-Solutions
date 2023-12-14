class Solution {
    func onesMinusZeros(_ grid: [[Int]]) -> [[Int]] {
        var rowBalance = Array(repeating: 0, count: grid.count)
        var colBalance = Array(repeating: 0, count: grid[0].count)
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                if grid[i][j] == 1 {
                    rowBalance[i] += 1
                    colBalance[j] += 1
                } else {
                    rowBalance[i] -= 1
                    colBalance[j] -= 1
                }
            }
        }

        var diff = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
        for i in 0 ..< diff.count {
            for j in 0 ..< diff[0].count {
                diff[i][j] = rowBalance[i] + colBalance[j]
            }
        }

        return diff
    }
}
