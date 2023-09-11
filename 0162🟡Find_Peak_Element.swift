class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1
        while l < r {
            let c = (l + r) / 2
            if c == nums.count - 1 || nums[c] > nums[c + 1] {
                r = c
            } else {
                l = c + 1
            }
        }
        return r
    }
}
