class Solution {
    private func dfs(
        _ rods: [Int],
        _ curInd: Int,
        _ diff: Int,
        _ memo: inout [[Int: Int]]
    ) -> Int {
        guard curInd < rods.count else {
            return diff == .zero ? 0 : -1
        }
        if let mem = memo[curInd][diff] {
            return mem
        }
        var result = dfs(rods, curInd + 1, diff, &memo)
        result = max(result, dfs(rods, curInd + 1, diff + rods[curInd], &memo))
        if diff < rods[curInd] {
            let opDiff = rods[curInd] - diff
            let subRes = dfs(rods, curInd + 1, opDiff, &memo)
            if subRes != -1 {
                result = max(result, diff + subRes)
            }
        } else {
            let subRes = dfs(rods, curInd + 1, diff - rods[curInd], &memo)
            if subRes != -1 {
                result = max(result, rods[curInd] + subRes)
            }
        }

        memo[curInd][diff] = result
        return result
    }

    func tallestBillboard(_ rods: [Int]) -> Int {
        var memo = Array(repeating: [Int: Int](), count: rods.count)
        return dfs(rods, .zero, .zero, &memo)
    }
}
