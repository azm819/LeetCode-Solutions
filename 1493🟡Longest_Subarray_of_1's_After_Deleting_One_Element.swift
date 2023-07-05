class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var zeroRepl = 0
        var oneRepl = 0
        var result = 0
        for num in nums {
            if num == .zero {
                oneRepl = zeroRepl
                zeroRepl = 0
            } else {
                zeroRepl += 1
                oneRepl += 1
                result = max(result, max(oneRepl, zeroRepl))
            }
        }
        return result == nums.count ? result - 1 : result
    }
}
