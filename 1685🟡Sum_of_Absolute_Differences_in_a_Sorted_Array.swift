class Solution {
    func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: nums.count)
        var prevSum = 0
        var nextSum = nums.reduce(0, +)
        for i in 0 ..< nums.count {
            result[i] = i * nums[i] - prevSum + nextSum - (nums.count - i) * nums[i]
            prevSum += nums[i]
            nextSum -= nums[i]
        }
        return result
    }
}

