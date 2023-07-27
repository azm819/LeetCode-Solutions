class Solution {
    func maxRunTime(_ n: Int, _ batteries: [Int]) -> Int {
        var l = 0
        var r = batteries.reduce(0, +) / n
        while l < r {
            let c = (l + r + 1) / 2
            var sum = 0
            let target = c * n
            var i = 0
            while sum < target && i < batteries.count {
                sum += min(c, batteries[i])
                i += 1
            }
            if sum < target {
                r = c - 1
            } else {
                l = c
            }
        }
        return r
    }
}
