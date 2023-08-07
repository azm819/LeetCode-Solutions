class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix[0][0] <= target && matrix.last!.last! >= target else { return false }
        var l = 0
        var r = matrix.count - 1
        var row = 0
        while l <= r {
            let c = (l + r) / 2
            if matrix[c][0] <= target && target <= matrix[c].last! {
                row = c
                break
            } else if target < matrix[c][0] {
                r = c - 1
            } else {
                l = c + 1
            }
        }
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
