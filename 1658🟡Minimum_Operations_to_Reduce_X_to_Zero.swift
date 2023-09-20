class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        let sum = nums.reduce(0, +)
        guard sum >= x else { return -1 }
        var x = x - sum
        var result: Int = .max
        var left = nums.count - 1
        var right = nums.count
        while left >= .zero {
            while x < .zero && left >= .zero {
                x += nums[left]
                left -= 1
            }
            while x > .zero && right > .zero {
                right -= 1
                x -= nums[right]
            }
            if x == .zero {
                result = min(result, (left + 1) + (nums.count - right))
                if left >= .zero {
                    x += nums[left]
                    left -= 1
                }
            }
        }
        return result == .max ? -1 : result
    }
}
