class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        guard var l = nums.firstIndex(where: { $0 % 2 == 1 }),
              var r = nums.lastIndex(where: { $0 % 2 == 0 }) else {
            return nums
        }
        var nums = nums
        while l < r {
            nums.swapAt(l, r)
            while l < r && nums[l] % 2 == 0 {
                l += 1
            }
            while l < r && nums[r] % 2 == 1 {
                r -= 1
            }
        }
        return nums
    }
}
