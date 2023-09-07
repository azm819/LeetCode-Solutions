class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rowZeros = Array(repeating: false, count: matrix.count)
        var columnZeros = Array(repeating: false, count: matrix[0].count)
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[0].count where matrix[i][j] == .zero {
                rowZeros[i] = true
                columnZeros[j] = true
            }
        }
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[0].count where rowZeros[i] || columnZeros[j] {
                matrix[i][j] = .zero
            }
        }
    }
}

