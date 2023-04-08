class NumMatrix {
    private let matrixSums: [[Int]]

    init(_ matrix: [[Int]]) {
        let n = matrix.count
        let m = matrix[0].count
        var matrixSums = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        for i in 1...n {
            for j in 1...m {
                matrixSums[i][j] = matrixSums[i - 1][j] + matrixSums[i][j - 1] - matrixSums[i - 1][j - 1] + matrix[i - 1][j - 1]
            }
        }
        self.matrixSums = matrixSums
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let sumRow2 = row2 + 1
        let sumCol2 = col2 + 1
        return matrixSums[sumRow2][sumCol2]
            - matrixSums[sumRow2][col1]
            - matrixSums[row1][sumCol2]
            + matrixSums[row1][col1]
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
