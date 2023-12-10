class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        for j in 0 ..< matrix[0].count {
            var row = [Int]()
            for i in 0 ..< matrix.count {
                row.append(matrix[i][j])
            }
            result.append(row)
        }
        return result
    }
}

