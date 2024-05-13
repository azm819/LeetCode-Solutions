class Solution {
    func matrixScore(_ grid: [[Int]]) -> Int {
        var curPowValue = 1 << (grid[0].count - 1)
        var result = 0
        for j in 0 ..< grid[0].count {
            var zerosCount = 0
            var onesCount = 0
            for i in 0 ..< grid.count {
                if grid[i][j] == 0 {
                    if grid[i][0] == 0 {
                        onesCount += 1
                    } else {
                        zerosCount += 1
                    }
                } else {
                    if grid[i][0] == 0 {
                        zerosCount += 1
                    } else {
                        onesCount += 1
                    }
                }
            }

            result += max(zerosCount, onesCount) * curPowValue
            curPowValue >>= 1
        }

        return result
    }
}
