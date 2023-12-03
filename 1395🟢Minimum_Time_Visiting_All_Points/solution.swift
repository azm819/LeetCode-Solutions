class Solution {
    func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        guard points.count > 1 else { return .zero }

        var result = 0
        var last = points[0]
        for i in 1 ..< points.count {
            result += max(abs(points[i][0] - last[0]), abs(points[i][1] - last[1]))
            last = points[i]
        }
        
        return result
    }
}

