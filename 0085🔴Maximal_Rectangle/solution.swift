class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        var curHist = Array(repeating: 0, count: matrix[0].count)
        var result = 0

        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count {
                if matrix[i][j] == "1" {
                    curHist[j] += 1
                } else {
                    curHist[j] = 0
                }
            }


            for height in 1 ... i + 1 {
                var width = 0
                for j in 0 ..< curHist.count {
                    if curHist[j] >= height {
                        width += 1
                    } else {
                        result = max(result, height * width)
                        width = 0
                    }
                }
                result = max(result, height * width)
            }
        }

        return result
    }
}
