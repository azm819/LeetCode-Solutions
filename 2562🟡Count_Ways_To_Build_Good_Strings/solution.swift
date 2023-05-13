class Solution {
    private func countGoodStrings(
        _ low: Int,
        _ high: Int,
        _ zero: Int,
        _ one: Int,
        _ curLen: Int,
        _ memo: inout [Int: Int]
    ) -> Int {
        guard curLen <= high else {
            return .zero
        }
        if let mem = memo[curLen] {
            return mem
        }
        var res = countGoodStrings(low, high, zero, one, curLen + zero, &memo) +
            countGoodStrings(low, high, zero, one, curLen + one, &memo)
        if curLen >= low {
            res += 1
        }
        res %= 1_000_000_007
        memo[curLen] = res
        return res
    }

    func countGoodStrings(_ low: Int, _ high: Int, _ zero: Int, _ one: Int) -> Int {
        var memo = [Int: Int]()
        return countGoodStrings(low, high, zero, one, .zero, &memo)
    }
}

