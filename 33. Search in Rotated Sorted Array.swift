class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let c = (l + r) / 2
            let val = nums[c]
            if val == target {
                return c
            } else if nums[l] <= val {
                if nums[l] <= target && val > target {
                    r = c - 1
                } else {
                    l = c + 1
                }
            } else {
                if nums[r] >= target && val < target {
                    l = c + 1
                } else {
                    r = c - 1
                }
            }
        }
        return -1
    }
}
