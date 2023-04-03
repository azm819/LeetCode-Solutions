class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var dists = [[Int]: Int]()
        return Array(points.sorted { lhs, rhs in
            let lhsDist: Int
            if let dist = dists[lhs] {
                lhsDist = dist
            } else {
                lhsDist = lhs[0] * lhs[0] + lhs[1] * lhs[1]
                dists[lhs] = lhsDist
            }
            let rhsDist: Int
            if let dist = dists[rhs] {
                rhsDist = dist
            } else {
                rhsDist = rhs[0] * rhs[0] + rhs[1] * rhs[1]
                dists[rhs] = rhsDist
            }
            return lhsDist < rhsDist
        }[..<k])
    }
}
