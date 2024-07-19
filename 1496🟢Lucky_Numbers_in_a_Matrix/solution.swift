class Solution {
    func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
        var rowMins = Array(repeating: Int.max, count: matrix.count)
        var columnMaxs = Array(repeating: Int.min, count: matrix[0].count)
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[0].count {
                rowMins[i] = min(rowMins[i], matrix[i][j])
                columnMaxs[j] = max(columnMaxs[j], matrix[i][j])
            }
        }

        var result = [Int]()
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[0].count where rowMins[i] == columnMaxs[j] {
                result.append(rowMins[i])
                break
            }
        }

        return result
    }
}

