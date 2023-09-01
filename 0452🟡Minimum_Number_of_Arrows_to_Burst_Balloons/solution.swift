class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let segments = points.sorted {
            $0[0] < $1[0] || $0[0] == $1[0] && $0[1] < $1[1]
        }
        var curPoint: Int = .min
        var result = 0
        for segment in segments {
            if segment[0] <= curPoint {
                curPoint = min(curPoint, segment[1])
            } else {
                result += 1
                curPoint = segment[1]
            }
        }
        return result
    }
}
