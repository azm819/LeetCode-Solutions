class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1
        while l < r {
            let c = (l + r) / 2
            let val = nums[c]
            if nums[c] >= nums[l] {
                if nums[r] >= nums[c] {
                    r = c - 1
                } else {
                    l = c + 1
                }
            } else {
                r = c
            }
        }
        return nums[l]
    }
}
