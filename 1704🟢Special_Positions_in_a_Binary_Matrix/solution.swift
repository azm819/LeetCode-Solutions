class Solution {
    func numSpecial(_ mat: [[Int]]) -> Int {
        var iCounts = Array(repeating: 0, count: mat.count)
        var jCounts = Array(repeating: 0, count: mat[0].count)
        for i in 0 ..< mat.count {
            for j in 0 ..< mat[0].count where mat[i][j] == 1 {
                iCounts[i] += 1
                jCounts[j] += 1
            }
        }
        var result = 0
        for i in 0 ..< mat.count where iCounts[i] == 1 {
            for j in 0 ..< mat[0].count where jCounts[j] == 1 && mat[i][j] == 1 {
                result += 1
            }
        }
        return result
    }
}

