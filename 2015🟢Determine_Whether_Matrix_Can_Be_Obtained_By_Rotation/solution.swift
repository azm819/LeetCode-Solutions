class Solution {
    func findRotation(_ mat: [[Int]], _ target: [[Int]]) -> Bool {
        var equal0 = true
        var equal1 = true
        var equal2 = true
        var equal3 = true
        let n = mat.count
        for i in 0..<n {
            for j in 0..<n {
                equal0 = equal0 && mat[i][j] == target[i][j]
                equal1 = equal1 && mat[i][j] == target[j][n - i - 1]
                equal2 = equal2 && mat[i][j] == target[n - i - 1][n - j - 1]
                equal3 = equal3 && mat[i][j] == target[n - j - 1][i]
            }
        }
        return equal0 || equal1 || equal2 || equal3
    }
}
