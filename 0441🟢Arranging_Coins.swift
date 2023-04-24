class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var l = 1
        var r = n
        while l <= r {
            let c = (l + r) / 2
            let maxSum = ((c + 1) / 2) * c + ((c + 1) % 2) * (c / 2)
            if n == maxSum {
                return c
            } else if n > maxSum {
                l = c + 1
            } else {
                if n > maxSum - c {
                    return c - 1
                }
                r = c - 1
            }
        }
        return l
    }
}
