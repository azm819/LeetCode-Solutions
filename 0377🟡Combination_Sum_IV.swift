class Solution {
    private var memo = Array(repeating: Int?.none, count: 1001)

    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        guard target > .zero else { return 1 }
        if let mem = memo[target] {
            return mem
        }
        var result = 0
        for num in nums where num <= target {
            result += combinationSum4(nums, target - num)
        }
        memo[target] = result
        return result
    }
}
