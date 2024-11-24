class Solution {
    func maxMatrixSum(_ matrix: [[Int]]) -> Int {
        var negativesEven = true
        var minAbsValue: Int = .max
        var absSum: Int = .zero
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count {
                if matrix[i][j] < .zero {
                    negativesEven.toggle()
                }

                let absValue = abs(matrix[i][j])
                minAbsValue = min(minAbsValue, absValue)
                absSum += absValue
            }
        }

        return negativesEven ? absSum : absSum - 2 * minAbsValue
    }
}
