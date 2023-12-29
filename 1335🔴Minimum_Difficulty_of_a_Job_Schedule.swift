class Solution {
    private func minDifficulty(
        _ ind: Int,
        _ jobDifficulty: [Int],
        _ days: Int,
        _ memo: inout [[Int?]]
    ) -> Int {
        guard days > .zero else {
            return ind == jobDifficulty.count ? .zero : 3_000_000
        }
        if let mem = memo[ind][days - 1] {
            return mem
        }
        var result: Int = .max
        var curMax: Int = .min
        for i in ind ... jobDifficulty.count - days {
            curMax = max(curMax, jobDifficulty[i])
            result = min(result, curMax + minDifficulty(i + 1, jobDifficulty, days - 1, &memo))
        }
        memo[ind][days - 1] = result
        return result
    }

    func minDifficulty(_ jobDifficulty: [Int], _ days: Int) -> Int {
        guard jobDifficulty.count >= days else { return -1 }
        var memo = Array(repeating: Array(repeating: Int?.none, count: days), count: jobDifficulty.count)
        return minDifficulty(.zero, jobDifficulty, days, &memo)
    }
}
