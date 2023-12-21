class Solution {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        let points = points.map { $0[0] }.sorted(by: <)
        var last = points[0]
        var result = 0
        for i in 1 ..< points.count {
            result = max(result, points[i] - last)
            last = points[i]
        }
        return result
    }
}

