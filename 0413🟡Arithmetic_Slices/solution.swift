class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return .zero }
        var result = 0
        var lastDiff = nums[1] - nums[0]
        var count = 0
        for i in 1 ..< nums.count {
            let diff = nums[i] - nums[i - 1]
            if diff == lastDiff {
                result += count
                count += 1
            } else {
                lastDiff = diff
                count = 1
            }
        }
        return result
    }
}

