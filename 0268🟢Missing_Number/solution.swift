class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var totalSum = 0
        var curSum = 0
        for i in 0 ..< nums.count {
            totalSum += i
            curSum += nums[i]
        }
        totalSum += nums.count
        return totalSum - curSum
    }
}

