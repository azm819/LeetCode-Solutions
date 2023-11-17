class Solution {
    func minPairSum(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var result: Int = .min
        var l = 0
        var r = nums.count - 1
        while l < r {
            result = max(result, nums[l] + nums[r])
            l += 1
            r -= 1
        }
        return result
    }
}
