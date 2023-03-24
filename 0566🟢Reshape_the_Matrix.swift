class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let n = mat.count
        let m = mat[0].count
        guard n * m == r * c else { return mat }
        var result = Array(repeating: Array(repeating: 0, count: c), count: r)
        for i in 0..<n * m {
            result[i / c][i % c] = mat[i / m][i % m]
        }
        return result
    }
}
