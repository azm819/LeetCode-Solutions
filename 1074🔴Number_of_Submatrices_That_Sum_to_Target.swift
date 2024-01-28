class Solution {
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        var prefixSums = Array(repeating: Array(repeating: Int.zero, count: matrix[0].count + 1), count: matrix.count + 1)
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[0].count {
                prefixSums[i + 1][j + 1] = matrix[i][j] + prefixSums[i + 1][j] + prefixSums[i][j + 1] - prefixSums[i][j]
            }
        }
        var result = 0
        for iL in 1 ... matrix.count {
            for jL in 1 ... matrix[0].count {
                for i in 0 ... matrix.count - iL {
                    for j in 0 ... matrix[0].count - jL {
                        let sum = prefixSums[i + iL][j + jL] - prefixSums[i][j + jL] - prefixSums[i + iL][j] + prefixSums[i][j]
                        if sum == target {
                            result += 1
                        }
                    }
                }
            }
        }
        return result
    }
}
