class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        var prevPoints = Array(repeating: Int.zero, count: points[0].count)
        for row in points {
            var curPoints = Array(repeating: Int.min, count: points[0].count)

            var curMax: Int = .zero
            for i in 0 ..< row.count {
                curMax = max(curMax - 1, prevPoints[i])
                curPoints[i] = curMax
            }

            curMax = .zero
            var i = row.count - 1
            while i >= .zero {
                curMax = max(curMax - 1, prevPoints[i])
                curPoints[i] = max(curPoints[i], curMax) + row[i]
                i -= 1
            }

            prevPoints = curPoints
        }

        return prevPoints.max()!
    }
}

