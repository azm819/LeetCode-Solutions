extension Array where Element == Int {
    mutating func insert(_ elem: Int) {
        var l = 0
        var r = count - 1
        while l <= r {
            let c = (l + r) / 2
            if self[c] == elem {
                return
            } else if self[c] < elem {
                l = c + 1
            } else {
                r = c - 1
            }
        }
        insert(elem, at: l)
    }
}

class Solution {
    func minimumDeviation(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            if num % 2 == 0 {
                set.insert(num)
            } else {
                set.insert(num * 2)
            }
        }
        var sortedNums = set.sorted()
        set.removeAll()
        var curMin = sortedNums.first!
        var curMax = sortedNums.popLast()!
        var res = curMax - curMin
        while curMax % 2 == 0 {
            var newElem = curMax / 2
            while newElem % 2 == 0 && newElem / 2 > curMin {
                newElem = newElem / 2
            }
            sortedNums.insert(newElem)
            if newElem < curMin {
                curMin = newElem
            }
            curMax = sortedNums.popLast()!
            res = min(res, curMax - curMin)
            if res == 0 {
                return 0
            }
        }
        return res
    }
}
