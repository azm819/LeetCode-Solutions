class Solution {
    func minBitFlips(_ start: Int, _ goal: Int) -> Int {
        var start = start
        var goal = goal
        var result = 0
        while start != .zero || goal != .zero {
            result += abs(start % 2 - goal % 2)
            start /= 2
            goal /= 2
        }
        return result
    }
}
