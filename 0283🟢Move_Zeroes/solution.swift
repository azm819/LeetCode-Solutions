class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var l = 0
        var r = 0
        while r < nums.count {
            if nums[r] != 0 {
                nums.swapAt(l, r)
                l += 1
            }
            r += 1
        }
        while l < nums.count {
            nums[l] = 0
            l += 1
        }
    }
}
