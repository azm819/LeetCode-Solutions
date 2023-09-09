class Solution {
    private func dp(_ cur: String, _ left: Int, _ right: Int, _ result: inout [String]) {
        guard left > .zero || right > .zero else {
            result.append(cur)
            return
        }

        if left > .zero {
            dp(cur + "(", left - 1, right, &result)
        }

        if right > left {
            dp(cur + ")", left, right - 1, &result)
        }
    }

    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        dp("", n, n, &result)
        return result
    }
}
