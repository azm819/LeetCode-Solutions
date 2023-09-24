class Solution {
    func countPairs(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        var l = 0
        var r = nums.count - 1
        var result = 0
        while l < r {
            if nums[l] + nums[r] < target {
                result += r - l
                l += 1
            } else {
                r -= 1
            }
        }
        return result
    }
}

