class Solution {
    private func dp(
        _ curInd: Int,
        _ curBalance: Int,
        _ cost: [Int],
        _ time: [Int],
        _ memo: inout [[Int: Int]]
    ) -> Int {
        guard curInd < cost.count else {
            return curBalance >= .zero ? .zero : .max
        }
        if let mem = memo[curInd][curBalance] {
            return mem
        }
        var result: Int = .max
        let subRes = dp(curInd + 1, curBalance + time[curInd], cost, time, &memo)
        if subRes != .max {
            result = cost[curInd] + subRes
        }
        result = min(result, dp(curInd + 1, curBalance - 1, cost, time, &memo))
        memo[curInd][curBalance] = result
        return result
    }

    func paintWalls(_ cost: [Int], _ time: [Int]) -> Int {
        var memo = Array(repeating: [Int: Int](), count: cost.count)
        return dp(.zero, .zero, cost, time, &memo)
    }
}
