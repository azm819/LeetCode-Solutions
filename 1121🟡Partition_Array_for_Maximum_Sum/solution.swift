class Solution {
    private func dp(
        _ ind: Int,
        _ curMax: Int,
        _ curK: Int,
        _ arr: [Int],
        _ k: Int,
        _ memo: inout [[Int?]]
    ) -> Int {
        guard ind < arr.count else {
            return curMax * (k - curK)
        }
        if let mem = memo[ind][curK] {
            return mem
        }
        var result = curMax * (k - curK) + dp(ind + 1, arr[ind], k - 1, arr, k, &memo)
        if curK > .zero {
            result = max(result, dp(ind + 1, max(curMax, arr[ind]), curK - 1, arr, k, &memo))
        }
        memo[ind][curK] = result
        return result
    }

    func maxSumAfterPartitioning(_ arr: [Int], _ k: Int) -> Int {
        var memo = Array(repeating: Array(repeating: Int?.none, count: k), count: arr.count)
        return dp(0, 0, 0, arr, k, &memo)
    }
}
