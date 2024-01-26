class Solution {
    private func dp(
        _ m: Int,
        _ n: Int,
        _ maxMove: Int,
        _ i: Int,
        _ j: Int,
        _ memo: inout [Int: [Int: [Int: Int]]]
    ) -> Int {
        guard i >= .zero && i < m && j >= .zero && j < n else {
            return 1
        }
        guard maxMove > .zero else {
            return 0
        }
        if let mem = memo[i]?[j]?[maxMove] {
            return mem
        }
        let move = maxMove - 1
        var result = dp(m, n, move, i + 1, j, &memo)
        result += dp(m, n, move, i - 1, j, &memo)
        result %= 1_000_000_007
        result += dp(m, n, move, i, j + 1, &memo)
        result %= 1_000_000_007
        result += dp(m, n, move, i, j - 1, &memo)
        result %= 1_000_000_007
        memo[i, default: [:]][j, default: [:]][maxMove] = result
        return result
    }

    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        var memo = [Int: [Int: [Int: Int]]]()
        return dp(m, n, maxMove, startRow, startColumn, &memo)
    }
}
