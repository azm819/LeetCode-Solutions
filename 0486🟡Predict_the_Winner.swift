class Solution {
    private func dp(
        _ left: Int,
        _ right: Int,
        _ nums: [Int],
        _ isFirst: Bool,
        _ memo: inout [Int: [Int: Int]]
    ) -> Int {
        guard left <= right else { return .zero }
        if let mem = memo[left]?[right] {
            return mem
        }
        let mult = isFirst ? 1 : -1
        let leftRes = mult * nums[left] + dp(left + 1, right, nums, !isFirst, &memo)
        let rightRes = mult * nums[right] + dp(left, right - 1, nums, !isFirst, &memo)
        let result: Int
        if isFirst {
            result = max(leftRes, rightRes)
        } else {
            result = min(leftRes, rightRes)
        }
        memo[left, default: [:]][right] = result
        return result
    }

    func PredictTheWinner(_ nums: [Int]) -> Bool {
        var memo = [Int: [Int: Int]]()
        return dp(.zero, nums.count - 1, nums, true, &memo) >= .zero
    }
}
