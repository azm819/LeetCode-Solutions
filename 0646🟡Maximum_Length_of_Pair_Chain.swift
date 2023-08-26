class Solution {
    private static func dp(
        _ last: Int,
        _ ind: Int,
        _ pairs: [[Int]],
        _ memo: inout [Int?]
    ) -> Int {
        guard ind < pairs.count else { return .zero }
        guard last < pairs[ind][0] else {
            return dp(last, ind + 1, pairs, &memo)
        }
        if let mem = memo[ind] {
            return mem
        }
        let result = max(
            dp(last, ind + 1, pairs, &memo),
            dp(pairs[ind][1], ind + 1, pairs, &memo) + 1
        )
        memo[ind] = result
        return result
    }

    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let pairs = pairs.sorted {
            $0[0] < $1[0] || $0[0] == $1[0] && $0[1] < $1[1]
        }
        var memo = Array(repeating: Optional<Int>.none, count: pairs.count)
        return Solution.dp(-1001, .zero, pairs, &memo)
    }
}

