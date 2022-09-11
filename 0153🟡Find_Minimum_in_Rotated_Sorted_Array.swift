class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0
        let n = nums.count - 1
        var r = n
        if nums[l] <= nums[r] {
            return nums[l]
        }
        while l <= r {
            let c = (l + r) / 2
            let val = nums[c]
            if c > 0 && val < nums[c - 1] {
                return val
            }

            if c <= n && val > nums[c + 1] {
                return nums[c + 1]
            }

            if nums[l] <= val {
                l = c + 1
            } else {
                r = c
            }
        }
        return -5000
    }
}
