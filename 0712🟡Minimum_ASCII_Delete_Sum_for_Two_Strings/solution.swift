class Solution {
    private func dp(
        _ ind1: String.Index,
        _ ind2: String.Index,
        _ s1: String,
        _ s2: String,
        _ memo: inout [String.Index: [String.Index: Int]]
    ) -> Int {
        if let mem = memo[ind1]?[ind2] {
            return mem
        }
        guard ind1 != s1.endIndex && ind2 != s2.endIndex else {
            var result = 0
            let oldInd1 = ind1
            var ind1 = ind1
            while ind1 != s1.endIndex {
                result += Int(s1[ind1].asciiValue!)
                ind1 = s1.index(after: ind1)
            }
            let oldInd2 = ind2
            var ind2 = ind2
            while ind2 != s2.endIndex {
                result += Int(s2[ind2].asciiValue!)
                ind2 = s2.index(after: ind2)
            }
            memo[oldInd1, default: [:]][oldInd2] = result
            return result
        }

        var result: Int = .max
        if s1[ind1] == s2[ind2] {
            result = dp(s1.index(after: ind1), s2.index(after: ind2), s1, s2, &memo)
        }

        result = min(result, dp(s1.index(after: ind1), ind2, s1, s2, &memo) + Int(s1[ind1].asciiValue!))
        result = min(result, dp(ind1, s2.index(after: ind2), s1, s2, &memo) + Int(s2[ind2].asciiValue!))

        memo[ind1, default: [:]][ind2] = result
        return result
    }

    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        var memo = [String.Index: [String.Index: Int]]()
        return dp(s1.startIndex, s2.startIndex, s1, s2, &memo)
    }
}
