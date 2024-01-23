class Solution {
    private func dp(
        _ ind1: String.Index,
        _ ind2: String.Index,
        _ text1: String,
        _ text2: String,
        _ memo: inout [String.Index: [String.Index: Int]]
    ) -> Int {
        guard ind1 != text1.endIndex && ind2 != text2.endIndex else {
            return .zero
        }
        if let mem = memo[ind1]?[ind2] {
            return mem
        }
        let result: Int
        if text1[ind1] == text2[ind2] {
            result = 1 + dp(text1.index(after: ind1), text2.index(after: ind2), text1, text2, &memo)
        } else {
            result = max(
                dp(ind1, text2.index(after: ind2), text1, text2, &memo),
                dp(text1.index(after: ind1), ind2, text1, text2, &memo)
            )
        }
        memo[ind1, default: [:]][ind2] = result
        return result
    }

    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var memo = [String.Index: [String.Index: Int]]()
        return dp(text1.startIndex, text2.startIndex, text1, text2, &memo)
    }
}

