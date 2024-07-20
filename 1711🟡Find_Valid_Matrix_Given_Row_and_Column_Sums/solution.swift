class Solution {
    func restoreMatrix(_ rowSum: [Int], _ colSum: [Int]) -> [[Int]] {
        var rowSum = rowSum
        var colSum = colSum
        var result = Array(repeating: Array(repeating: Int.zero, count: colSum.count), count: rowSum.count)
        for i in 0 ..< rowSum.count {
            for j in 0 ..< colSum.count {
                result[i][j] = min(rowSum[i], colSum[j])
                rowSum[i] -= result[i][j]
                colSum[j] -= result[i][j]
            }
        }

        return result
    }
}

