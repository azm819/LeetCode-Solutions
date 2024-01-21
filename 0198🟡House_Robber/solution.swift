class Solution {
    private func rob(_ ind: Int, _ nums: [Int], _ memo: inout [Int?]) -> Int {
        guard ind < nums.count else { return .zero }
        if let mem = memo[ind] { return mem }
        let result = max(
            nums[ind] + rob(ind + 2, nums, &memo),
            rob(ind + 1, nums, &memo)
        )
        memo[ind] = result
        return result
    }

    func rob(_ nums: [Int]) -> Int {
        var memo = Array(repeating: Int?.none, count: nums.count)
        return rob(.zero, nums, &memo)
    }
}

