class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        guard var l = nums.firstIndex(of: .zero) else { return }
        var r = l + 1
        while r < nums.count {
            if nums[r] != 0 {
                nums.swapAt(l, r)
                l += 1
            }
            r += 1
        }
    }
}
