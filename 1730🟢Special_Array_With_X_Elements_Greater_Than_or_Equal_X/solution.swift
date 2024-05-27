class Solution {
    func specialArray(_ nums: [Int]) -> Int {
        var l = 1
        var r = nums.count
        while l < r {
            let c = (l + r) / 2
            var count = 0
            for num in nums where num >= c {
                count += 1
            }
            if count == c {
                return c
            } else if count > c {
                l = c + 1
            } else {
                r = c
            }
        }
        var count = 0
        for num in nums where num >= l {
            count += 1
        }
        return count == l ? l : -1
    }
}
