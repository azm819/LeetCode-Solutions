class Solution {
    func minGroups(_ intervals: [[Int]]) -> Int {
        var minPoint: Int = .max
        var maxPoint: Int = .min
        for interval in intervals {
            minPoint = min(minPoint, interval[0], interval[1])
            maxPoint = max(maxPoint, interval[0], interval[1])
        }

        var pointCounts = Array(repeating: Int.zero, count: maxPoint - minPoint + 2)

        for interval in intervals {
            pointCounts[interval[0] - minPoint] += 1
            pointCounts[interval[1] - minPoint + 1] -= 1
        }

        var maxIntersections: Int = .zero
        var curIntersections: Int = .zero
        for count in pointCounts {
            curIntersections += count
            maxIntersections = max(maxIntersections, curIntersections)
        }

        return maxIntersections
    }
}
