class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var r = 0
        var sum = 0
        while r < k {
            sum += nums[r]
            r += 1
        }
        var l = 0
        var result: Double = Double(sum) / Double(k)
        while r < nums.count {
            sum += nums[r]
            sum -= nums[l]
            result = max(result, Double(sum) / Double(k))
            l += 1
            r += 1
        }
        return result
    }
}

