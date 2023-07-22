class Solution {
    private func dp(_ k: Int, _ row: Int, _ column: Int, _ memo: inout [[[Int: Double]]]) -> Double {
        guard row >= .zero && row < memo.count && column >= .zero && column < memo[0].count else {
            return .zero
        }
        guard k > .zero else {
            return 1
        }
        if let mem = memo[row][column][k] {
            return mem
        }
        var result: Double = .zero
        result += dp(k - 1, row - 2, column - 1, &memo) / 8
        result += dp(k - 1, row - 2, column + 1, &memo) / 8
        result += dp(k - 1, row + 2, column - 1, &memo) / 8
        result += dp(k - 1, row + 2, column + 1, &memo) / 8
        result += dp(k - 1, row - 1, column - 2, &memo) / 8
        result += dp(k - 1, row - 1, column + 2, &memo) / 8
        result += dp(k - 1, row + 1, column - 2, &memo) / 8
        result += dp(k - 1, row + 1, column + 2, &memo) / 8
        memo[row][column][k] = result
        return result
    }

    func knightProbability(_ n: Int, _ k: Int, _ row: Int, _ column: Int) -> Double {
        var memo = Array(repeating: Array(repeating: [Int: Double](), count: n), count: n)
        return dp(k, row, column, &memo)
    }
}
