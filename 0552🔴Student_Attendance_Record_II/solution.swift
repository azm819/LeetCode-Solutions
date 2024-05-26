class Solution {
    private func dp(
        _ n: Int,
        _ absentDays: Int,
        _ lateDays: Int,
        _ memo: inout [[[Int?]]]
    ) -> Int {
        guard absentDays < 2 && lateDays < 3 else {
            return .zero
        }

        guard n > .zero else {
            return 1
        }

        if let mem = memo[n][absentDays][lateDays] {
            return mem
        }

        var result = dp(n - 1, absentDays, .zero, &memo)

        result += dp(n - 1, absentDays + 1, .zero, &memo)
        result %= 1_000_000_007
        result += dp(n - 1, absentDays, lateDays + 1, &memo)
        result %= 1_000_000_007
        memo[n][absentDays][lateDays] = result
        return result
    }

    func checkRecord(_ n: Int) -> Int {
        var memo = Array(repeating: Array(repeating: Array(repeating: Int?.none, count: 3), count: 2), count: n + 1)
        return dp(n, .zero, .zero, &memo)
    }
}

