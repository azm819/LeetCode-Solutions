class Solution {
    func minimumAverage(_ nums: [Int]) -> Double {
        let nums = nums.sorted()
        var l = 0
        var r = nums.count - 1
        var result: Double = .greatestFiniteMagnitude
        while l < r {
            result = min(result, (Double(nums[l]) + Double(nums[r])) / 2)
            l += 1
            r -= 1
        }

        return result
    }
}

