class Solution {
    func maxEqualRowsAfterFlips(_ matrix: [[Int]]) -> Int {
        var frequencies = [String: Int]()
        for row in matrix {
            var mask = ""
            for digit in row {
                if digit == row[0] {
                    mask += "F"
                } else {
                    mask += "S"
                }
            }

            frequencies[mask, default: .zero] += 1
        }

        return frequencies.values.max()!
    }
}

