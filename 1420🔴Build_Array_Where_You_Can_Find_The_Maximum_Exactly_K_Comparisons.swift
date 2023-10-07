class Solution {
    private func dp(
        _ k: Int,
        _ prevMax: Int,
        _ curInd: Int,
        _ memo: inout [[[Int?]]]
    ) -> Int {
        guard curInd < memo.count else {
            return 1
        }
        if let mem = memo[curInd][prevMax][k] {
            return mem
        }
        let nextInd = curInd + 1
        var result = 0
        if prevMax > .zero && k < memo.count - curInd {
            result += (dp(k, prevMax, nextInd, &memo) * prevMax) % 1_000_000_007
        }
        if k > .zero && prevMax < memo[0].count - 1 {
            let newK = k - 1
            for newMax in prevMax + 1 ... memo[0].count - 1 {
                result += dp(newK, newMax, nextInd, &memo)
                result %= 1_000_000_007
            }
        }
        memo[curInd][prevMax][k] = result
        return result
    }

    func numOfArrays(_ n: Int, _ m: Int, _ k: Int) -> Int {
        var memo = Array(repeating: Array(repeating: Array(repeating: Int?.none, count: k + 1), count: m + 1), count: n)
        return dp(k, .zero, .zero, &memo)
    }
}
