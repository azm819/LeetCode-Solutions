class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        // y1 = k * x1 + a
        // y2 = k * x2 + a
        // y1 - y2 = k * (x1 - x2)
        // k = (y1 - y2) / (x1 - x2)
        let x1 = coordinates[0][0]
        let y1 = coordinates[0][1]
        let x2 = coordinates[1][0]
        let y2 = coordinates[1][1]
        guard x1 != x2 else {
            return coordinates.allSatisfy { $0[0] == x1 }
        }
        let k = Double(y1 - y2) / Double(x1 - x2)
        let a = Double(y1) - k * Double(x1)
        for coordinate in coordinates {
            if Double(coordinate[1]) != k * Double(coordinate[0]) + a {
                return false
            }
        }
        return true
    }
}
