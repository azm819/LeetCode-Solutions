class Solution {
    private static func dp(
        _ cur: Int,
        _ firstDry: [Int],
        _ taps: [[Int]],
        _ memo: inout [Int?]
    ) -> Int {
        guard cur < memo.count else {
            return .zero
        }
        if let mem = memo[cur] {
            return mem
        }
        var result: Int = .max
        for tap in taps[cur] {
            let subRes = dp(
                firstDry[tap],
                firstDry,
                taps,
                &memo
            )
            if subRes == -1 {
                break
            }
            result = min(
                result,
                subRes + 1
            )
        }
        if result == .max {
            result = -1
        }
        memo[cur] = result
        return result
    }

    func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
        var firstDry = Array(repeating: 0, count: n + 1)
        var taps = Array(repeating: [Int](), count: n + 1)
        for i in 0 ..< ranges.count where ranges[i] != .zero {
            for j in max(i - ranges[i], .zero) ... min(i + ranges[i] - 1, n) {
                taps[j].append(i)
            }
            firstDry[i] = i + ranges[i]
        }
        var memo = Array(repeating: Optional<Int>.none, count: n)
        return Solution.dp(.zero, firstDry, taps, &memo)
    }
}
