class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard var r = nums.lastIndex(where: { $0 != val }) else { return .zero }
        var l = 0
        while l < r {
            if nums[l] == val {
                nums.swapAt(l, r)
                while r >= .zero && nums[r] == val {
                    r -= 1
                }
            }
            l += 1
        }
        return nums[l] == val ? l : l + 1
    }
}

