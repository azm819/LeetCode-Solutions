class Solution {
    private func dp(
        _ p: Int,
        _ i: Int,
        _ stoneValues: [Int],
        _ memo: inout [[Int?]]
    ) -> Int {
        guard i < stoneValues.count else { return .zero }
        if let mem = memo[p][i] {
            return mem
        }
        var result: Int = p == .zero ? .min : .max
        let newP = 1 - p
        let fRes = dp(newP, i + 1, stoneValues, &memo)
        if p == .zero {
            result = max(result, stoneValues[i] + fRes)
        } else {
            result = min(result, fRes)
        }
        if i < stoneValues.count - 1 {
            let sRes = dp(newP, i + 2, stoneValues, &memo)
            if p == .zero {
                result = max(result, stoneValues[i] + stoneValues[i + 1] + sRes)
            } else {
                result = min(result, sRes)
            }
        }
        if i < stoneValues.count - 2 {
            let tRes = dp(newP, i + 3, stoneValues, &memo)
            if p == .zero {
                result = max(result, stoneValues[i] + stoneValues[i + 1] + stoneValues[i + 2] + tRes)
            } else {
                result = min(result, tRes)
            }
        }
        memo[p][i] = result
        return result
    }

    func stoneGameIII(_ stoneValues: [Int]) -> String {
        var memo = Array(
            repeating: Array(
                repeating: Optional<Int>.none,
                count: stoneValues.count
            ),
            count: 2
        )
        let aliceScore = dp(.zero, .zero, stoneValues, &memo)
        let totalScore = stoneValues.reduce(0, +)
        let bobScore = totalScore - aliceScore
        if aliceScore > bobScore {
            return "Alice"
        } else if bobScore > aliceScore {
            return "Bob"
        } else {
            return "Tie"
        }
    }
}
