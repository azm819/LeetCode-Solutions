class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        var visited = Array(repeating: false, count: points.count)
        var distance = Array(repeating: Int.max, count: points.count)
        var result = 0
        var cur = 0
        visited[cur] = true
        distance[cur] = 0
        var left = points.count - 1
        while left > .zero {
            var minDist: Int = .max
            var minInd = 0
            for i in 0 ..< points.count where !visited[i] {
                distance[i] = min(distance[i], abs(points[i][0] - points[cur][0]) + abs(points[i][1] - points[cur][1]))
                if minDist > distance[i] {
                    minDist = distance[i]
                    minInd = i
                }
            }
            result += minDist
            cur = minInd
            visited[minInd] = true
            left -= 1
        }
        return result
    }
}
