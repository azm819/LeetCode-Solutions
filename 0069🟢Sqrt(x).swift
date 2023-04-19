class Solution {
    func mySqrt(_ x: Int) -> Int {
        var l = 0
        var r = x
        while l < r {
            let c = (l + r + 1) / 2
            let square = c * c
            if square == x {
                return c
            } else if square < x {
                l = c
            } else {
                r = c - 1
            }
        }
        return l
    }
}
