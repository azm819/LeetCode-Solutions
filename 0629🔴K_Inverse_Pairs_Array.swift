class Solution {
    private func dp(
        _ i: Int,
        _ n: Int,
        _ k: Int,
        _ memo: inout [[Int?]]
    ) -> Int {
        guard i < n else {
            return k == .zero ? 1 : 0
        }
        if let mem = memo[i][k] {
            return mem
        }
        var result = 0
        for p in 0 ... min(i, k) {
            result += dp(i + 1, n, k - p, &memo)
            result %= 1_000_000_007
        }
        memo[i][k] = result
        return result
    }

    func kInversePairs(_ n: Int, _ k: Int) -> Int {
        var memo = Array(repeating: Array(repeating: Int?.none, count: k + 1), count: n)
        return dp(.zero, n, k, &memo)
    }
}

