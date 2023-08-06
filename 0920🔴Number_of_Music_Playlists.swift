class Solution {
    private func dp(
        _ n: Int,
        _ goal: Int,
        _ k: Int,
        _ played: Int,
        _ unique: Int,
        _ memo: inout [[Int: Int]]
    ) -> Int {
        guard played < goal else { return unique == n ? 1 : 0 }
        if let mem = memo[played][unique] {
            return mem
        }
        var result = 0
        result += (n - unique) * dp(n, goal, k, played + 1, unique + 1, &memo)
        result %= 1_000_000_007
        if played > k {
            result += (unique - k) * dp(n, goal, k, played + 1, unique, &memo)
            result %= 1_000_000_007
        }
        memo[played][unique] = result
        return result
    }

    func numMusicPlaylists(_ n: Int, _ goal: Int, _ k: Int) -> Int {
        var memo = Array(repeating: [Int: Int](), count: goal)
        return dp(n, goal, k, 0, 0, &memo)
    }
}
