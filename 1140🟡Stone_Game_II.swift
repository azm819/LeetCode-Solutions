class Solution {
    private func dp(
        _ p: Int,
        _ i: Int,
        _ m: Int,
        _ piles: [Int],
        _ memo: inout [[[Int?]]]
    ) -> Int {
        guard i < piles.count else { return .zero }
        if let mem = memo[p][i][min(m, piles.count)] {
            return mem
        }
        var result: Int = p == .zero ? .zero : .max
        var curSum = 0
        for c in 0..<2 * m {
            let newInd = i + c
            if newInd >= piles.count {
                break
            }
            curSum += piles[newInd]
            let curRes = dp(1 - p, newInd + 1, max(m, c + 1), piles, &memo)
            if p == .zero {
                result = max(result, curSum + curRes)
            } else {
                result = min(result, curRes)
            }
        }
        memo[p][i][min(m, piles.count)] = result
        return result
    }

    func stoneGameII(_ piles: [Int]) -> Int {
        guard piles.count > 2 else { return piles.reduce(0, +) }
        var memo = Array(
            repeating: Array(
                repeating: Array(
                    repeating: Optional<Int>.none,
                    count: piles.count
                ),
                count: piles.count
            ),
            count: 2
        )
        return dp(.zero, .zero, 1, piles, &memo)
    }
}
