class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: 1, count: nums.count)
        for i in 1 ..< nums.count {
            result[i] = nums[i - 1] * result[i - 1]
        }
        var i = nums.count - 2
        var product = 1
        while i >= .zero {
            product *= nums[i + 1]
            result[i] *= product
            i -= 1
        }
        return result
    }
}
