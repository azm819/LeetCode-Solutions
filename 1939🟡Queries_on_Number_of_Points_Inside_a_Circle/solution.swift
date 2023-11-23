class Solution {
    func countPoints(_ points: [[Int]], _ queries: [[Int]]) -> [Int] {
        queries.map { query in
            let squareRadius = query[2] * query[2]
            return points.filter { point in
                let xDiff = abs(query[0] - point[0])
                let yDiff = abs(query[1] - point[1])
                return xDiff * xDiff + yDiff * yDiff <= squareRadius
            }.count
        }
    }
}
