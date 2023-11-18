class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var l = 0
        var r = 1
        var balance = k
        var level = nums[0]
        var result = 1
        while l < nums.count {
            while r < nums.count && (nums[r] - level) * (r - l) <= balance {
                balance -= (nums[r] - level) * (r - l)
                level = nums[r]
                r += 1
                result = max(result, r - l)
            }
            balance += level - nums[l]
            l += 1
        }
        return result
    }
}

