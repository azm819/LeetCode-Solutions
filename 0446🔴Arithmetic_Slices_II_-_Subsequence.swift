class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return .zero }
        var result = 0
        var dp = Array(repeating: [Int: Int](), count: nums.count)
        for i in 1 ..< nums.count {
            for j in 0 ..< i {
                let diff = nums[j] - nums[i]
                let last = dp[j][diff, default: .zero]
                result += last
                dp[i][diff, default: .zero] += last + 1
            }
        }
        return result
    }
}

