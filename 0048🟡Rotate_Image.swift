class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count - 1
        let halfN = (matrix.count + 1) / 2
        for i in 0..<halfN {
            for j in i..<n - i {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[n - j][i]
                matrix[n - j][i] = matrix[n - i][n - j]
                matrix[n - i][n - j] = matrix[j][n - i]
                matrix[j][n - i] = tmp
            }
        }
    }
}
