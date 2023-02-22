class Solution {
    private func check(_ weights: [Int], _ days: Int, _ cap: Int) -> Bool {
        var day = 1
        var curCap = 0
        for weight in weights {
            if curCap + weight > cap {
                day += 1
                curCap = weight
            } else {
                curCap += weight
            }
            if day > days {
                return false
            }
        }
        return day <= days
    }

    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var l = 0
        var r = 0
        for weight in weights {
            l = max(l, weight)
            r += weight
        }
        while l <= r {
            let c = (l + r) / 2
            if check(weights, days, c) {
                r = c - 1
            } else {
                l = c + 1
            }
        }
        return l
    }
}
