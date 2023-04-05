class Solution {
    func minimizeArrayValue(_ nums: [Int]) -> Int {
        var result = nums[0]
        var prefSum = nums[0]
        for i in 1..<nums.count {
            prefSum += nums[i]
            result = max(result, (prefSum + i) / (i + 1))
        }
        return result
    }
}
