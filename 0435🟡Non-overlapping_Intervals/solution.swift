class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let intervals = intervals
            .map { ($0[0], $0[1]) }
            .sorted { (lhs: (Int, Int), rhs: (Int, Int)) in lhs.1 < rhs.1 }

        var lastPoint: Int = .min
        var result = 0
        for interval in intervals {
            if interval.0 >= lastPoint {
                lastPoint = interval.1
            } else {
                result += 1
            }
        }
        return result
    }
}
