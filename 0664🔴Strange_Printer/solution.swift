class Solution {
    private func dp(
        _ left: Int,
        _ right: Int,
        _ str: [Character],
        _ coveringCh: Character,
        _ memo: inout [[[Character: Int]]]
    ) -> Int {
        var left = left
        while left <= right && str[left] == coveringCh {
            left += 1
        }
        while left < right && str[left] == str[left + 1] {
            left += 1
        }
        var right = right
        while left <= right && str[left] == coveringCh {
            right -= 1
        }
        while left < right && str[right] == str[right - 1] {
            right -= 1
        }

        guard left <= right else { return .zero }
        guard left < right else { return 1 }
        if let mem = memo[left][right][coveringCh] {
            return mem
        }

        var result: Int = .max
        if str[left] == str[right] {
            result = 1 + dp(left + 1, right - 1, str, str[left], &memo)
        }
        for i in left ..< right {
            result = min(result, dp(left, i, str, coveringCh, &memo) + dp(i + 1, right, str, coveringCh, &memo))
        }
        memo[left][right][coveringCh] = result
        return result
    }

    func strangePrinter(_ s: String) -> Int {
        let str = Array(s)
        var memo = Array(repeating: Array(repeating: [Character: Int](), count: str.count), count: str.count)
        return dp(.zero, str.count - 1, str, " ", &memo)
    }
}
