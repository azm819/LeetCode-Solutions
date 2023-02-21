class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let c = (l + r) / 2
            if c > 0 && nums[c - 1] == nums[c] {
                if c % 2 == 1 {
                    l = c + 1
                } else {
                    r = c - 2
                }
            } else if c < nums.count - 1 && nums[c + 1] == nums[c] {
                if c % 2 == .zero {
                    l = c + 2
                } else {
                    r = c - 1
                }
            } else {
                return nums[c]
            }
        }
        return -1
    }
}
