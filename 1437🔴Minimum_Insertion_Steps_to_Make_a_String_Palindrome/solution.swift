class Solution {
    func dp(_ str: [Character], _ l: Int, _ r: Int, _ memo: inout [[Int?]]) -> Int {
        guard l < r else { return .zero }
        if let mem = memo[l][r] {
            return mem
        }
        if str[l] == str[r] {
            let res = dp(str, l + 1, r - 1, &memo)
            memo[l][r] = res
            return res
        }
        let res = 1 + min(
            dp(str, l, r - 1, &memo),
            dp(str, l + 1, r, &memo)
        )
            memo[l][r] = res
            return res
    }

    func minInsertions(_ s: String) -> Int {
        var memo = Array(repeating: Array(repeating: Optional<Int>.none, count: s.count), count: s.count)
        return dp(Array(s), 0, s.count - 1, &memo)
    }
}
