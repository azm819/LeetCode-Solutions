class Solution {
    private func dp(
        _ questions: [[Int]],
        _ ind: Int,
        _ memo: inout [Int?]
    ) -> Int {
        guard ind < questions.count else { return .zero }
        if let mem = memo[ind] {
            return mem
        }
        let res = max(
            questions[ind][0] + dp(questions, ind + questions[ind][1] + 1, &memo),
            dp(questions, ind + 1, &memo)
        )
        memo[ind] = res
        return res
    }

    func mostPoints(_ questions: [[Int]]) -> Int {
        var memo = Array(repeating: Optional<Int>.none, count: questions.count)
        return dp(questions, .zero, &memo)
    }
}

