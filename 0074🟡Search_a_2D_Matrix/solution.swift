class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var l = 0
        var r = matrix.count - 1
        while l < r {
            let c = (l + r) / 2
            if matrix[c][0] == target {
                return true
            } else if matrix[c][0] < target {
                if matrix[c + 1][0] > target {
                    l = c
                    break
                } else {
                    l = c + 1
                }
            } else {
                r = c - 1
            }
        }
        let row = l
        l = 0
        r = matrix[row].count - 1
        while l <= r {
            let c = (l + r) / 2
            if matrix[row][c] == target {
                return true
            } else if matrix[row][c] > target {
                r = c - 1
            } else {
                l = c + 1
            }
        }
        return false
    }
}
