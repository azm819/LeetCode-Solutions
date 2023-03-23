class Solution {
    func diagonalSum(_ mat: [[Int]]) -> Int {
        let n = mat.count - 1
        var result = 0
        for i in 0...n {
            result += mat[i][i]
            if i != n - i {
                result += mat[i][n - i]
            }
        }
        return result
    }
}
