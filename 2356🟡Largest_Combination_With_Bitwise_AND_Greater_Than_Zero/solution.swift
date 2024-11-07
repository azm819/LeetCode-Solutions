class Solution {
    func largestCombination(_ candidates: [Int]) -> Int {
        let maxCandidate = candidates.max() ?? .zero
        var bit = 1
        var result: Int = .zero
        while bit <= maxCandidate {
            var subRes: Int = .zero
            for candidate in candidates where candidate & bit == bit {
                subRes += 1
            }
            result = max(result, subRes)
            bit *= 2
        }

        return result
    }
}

