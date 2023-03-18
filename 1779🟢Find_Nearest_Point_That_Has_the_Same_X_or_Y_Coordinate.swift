class Solution {
    func nearestValidPoint(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
        var result = -1
        var resultDist = Int.max
        for i in 0..<points.count where points[i][0] == x || points[i][1] == y {
            let dist = abs(points[i][0] - x) + abs(points[i][1] - y)
            if resultDist > dist {
                resultDist = dist
                result = i
            }
        }
        return result
    }
}
