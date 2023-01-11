class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return -1 }
        guard nums.count > 1 else { return 0 }
        var left = 0
        var right = -nums[0]
        for i in nums {
            right += i
        }
        var ind = 0
        // [1,7,3,6,5,6]
        while ind < nums.count && left != right {
            left += nums[ind]
            if ind + 1 < nums.count {
                right -= nums[ind + 1]
                ind += 1
            } else {
                return -1
            }
        }
        return ind
    }
}
