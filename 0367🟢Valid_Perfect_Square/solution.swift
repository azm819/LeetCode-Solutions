class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var l = 1
        var r = num
        while l <= r {
            let c = (l + r) / 2
            let square = c * c
            if square == num {
                return true
            } else if square < num {
                l = c + 1
            } else {
                r = c - 1
            }
        }
        return false
    }
}
