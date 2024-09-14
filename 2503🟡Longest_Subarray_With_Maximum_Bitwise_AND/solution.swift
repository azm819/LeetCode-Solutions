class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        let maxNum = nums.max()!
        var result = 0
        var curCount = 0
        for num in nums {
            if num == maxNum {
                curCount += 1
                result = max(result, curCount)
            } else {
                curCount = 0
            }
        }

        return result
    }
}
