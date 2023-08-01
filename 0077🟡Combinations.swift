class Solution {
    private struct Combination: OptionSet, Hashable {
        var rawValue: Int
    }

    private func dp(
        _ curComb: Combination,
        _ curCount: Int,
        _ last: Int,
        _ n: Int,
        _ k: Int,
        _ memo: inout [Combination: [[Int]]]
    ) -> [[Int]] {
        guard curCount < k else { return [[]] }
        if let mem = memo[curComb] {
            return mem
        }
        var result = [[Int]]()
        for i in last + 1 ... n - (k - curCount - 1) {
            let comb = Combination(rawValue: 1 << i)
            if !curComb.contains(comb) {
                var curComb = curComb
                curComb.insert(comb)
                for subRes in dp(curComb, curCount + 1, i, n, k, &memo) {
                    result.append(subRes + [i])
                }
            }
        }
        memo[curComb] = result
        return result
    }

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard k < n else { return [Array(1 ... n)] }
        var memo = [Combination: [[Int]]]()
        return dp(Combination(rawValue: .zero), .zero, .zero, n, k, &memo)
    }
}
