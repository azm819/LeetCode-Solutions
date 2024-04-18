class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var count = 0
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[i].count where grid[i][j] == 1 {
                count += 4

                if i - 1 >= 0 && grid[i - 1][j] == 1 {
                    count -= 2
                }

                if j - 1 >= 0 && grid[i][j - 1] == 1 {
                    count -= 2
                }
            }
        }

        return count
    }
}
