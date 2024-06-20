class Solution {
    func maximumCount(_ nums: [Int]) -> Int {
        var l = -1
        var r = nums.count - 1
        while l < r {
            let m = (l + r + 1) / 2
            if nums[m] < .zero {
                l = m
            } else {
                r = m - 1
            }
        }
        let negNumsCount = l + 1

        l = 0
        r = nums.count
        while l < r {
            let m = (l + r) / 2
            if nums[m] > .zero {
                r = m
            } else {
                l = m + 1
            }
        }
        let posNumsCount = nums.count - l

        return max(posNumsCount, negNumsCount)
    }
}
