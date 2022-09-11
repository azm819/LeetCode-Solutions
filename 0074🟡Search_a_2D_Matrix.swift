class Solution {
    private func getInd(i: Int, n: Int) -> (Int, Int) {
        let f = i / n
        let s = i - f * n
        if s == 0 {
            return (f - 1, n - 1)
        }
        return (f, s - 1)
    }

    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var l = 1
        let n = matrix[0].count
        let m = matrix.count
        var r = n * m
        while l <= r {
            let c = (l + r) / 2
            let ind = getInd(i: c, n: n)
            let value = matrix[ind.0][ind.1]
            if value == target {
                return true
            } else if value < target {
                l = c + 1
            } else {
                r = c - 1
            }
        }
        return false
    }
}
