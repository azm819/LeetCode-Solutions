class Solution {
    private func dp(
        _ l: Int,
        _ r: Int,
        _ lI: Int,
        _ rI: Int,
        _ cuts: [Int],
        _ memo: inout [[Int?]]
    ) -> Int {
        guard lI <= rI else { return .zero }
        if let mem = memo[lI][rI] {
            return mem
        }
        var result: Int = .max
        for i in lI...rI {
            let cut = cuts[i]
            result = min(
                result,
                dp(l, cut, lI, i - 1, cuts, &memo) + dp(cut, r, i + 1, rI, cuts, &memo)
            )
        }
        result += r - l
        memo[lI][rI] = result
        return result
    }

    func minCost(_ n: Int, _ cuts: [Int]) -> Int {
        var memo = Array(
            repeating: Array(
                repeating: Optional<Int>.none,
                count: cuts.count
            ),
            count: cuts.count
        )
        return dp(0, n, 0, cuts.count - 1, cuts.sorted(), &memo)
    }
}

