class Solution {
    private func numWays(
        _ characterInd: Int,
        _ targetInd: Int,
        _ target: [Character],
        _ charactersCounts: [[Character: Int64]],
        _ memo: inout [[Int64?]]
    ) -> Int64 {
        guard characterInd >= targetInd else { return .zero }
        guard targetInd >= .zero else { return 1 }
        guard characterInd >= .zero else { return .zero }
        if let mem = memo[characterInd][targetInd] {
            return mem
        }
        var res = numWays(characterInd - 1, targetInd, target, charactersCounts, &memo)
        if let characterCount = charactersCounts[characterInd][target[targetInd]] {
            res += characterCount * numWays(characterInd - 1, targetInd - 1, target, charactersCounts, &memo)
        }
        memo[characterInd][targetInd] = res
        return res % 1_000_000_007
    }

    func numWays(_ words: [String], _ target: String) -> Int {
        var charactersCounts = Array(repeating: [Character: Int64](), count: words[0].count)
        for word in words {
            var ind = 0
            for ch in word {
                charactersCounts[ind][ch, default: .zero] += 1
                ind += 1
            }
        }
        var memo = Array(repeating: Array(repeating: Optional<Int64>.none, count: target.count), count: words[0].count)
        return Int(numWays(words[0].count - 1, target.count - 1, Array(target), charactersCounts, &memo))
    }
}
