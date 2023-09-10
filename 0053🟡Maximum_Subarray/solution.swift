class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var curMax = nums.first!
        var absMax = curMax
        for num in nums.dropFirst() {
            curMax = max(num, curMax + num)
            absMax = max(absMax, curMax)
        }
        return absMax
    }
}
