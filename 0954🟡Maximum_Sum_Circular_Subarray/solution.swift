class Solution {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var ind = nums.count - 1
        var rightMax = Array(repeating: 0, count: nums.count)
        rightMax[ind] = nums[ind]
        var sum = nums[ind]
        ind -= 1
        while ind >= .zero {
            sum += nums[ind]
            rightMax[ind] = max(rightMax[ind + 1], sum)
            ind -= 1
        }
        var specSum = nums[0]
        var maxSum = nums[0]
        var prevSum = 0
        var curMax = 0
        for i in 0..<nums.count {
            curMax = max(curMax, 0) + nums[i]
            maxSum = max(maxSum, curMax)
            prevSum += nums[i]
            if i + 1 < nums.count {
                specSum = max(specSum, prevSum + rightMax[i + 1])
            }
        }
        return max(maxSum, specSum)
    }
}
