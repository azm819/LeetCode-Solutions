class Solution {
    private struct Point: Hashable {
        var x: Int
        var y: Int
    }

    func isPathCrossing(_ path: String) -> Bool {
        var curPoint = Point(x: .zero, y: .zero)
        var visited = Set<Point>()
        visited.insert(curPoint)
        for dir in path {
            switch dir {
            case "N":
                curPoint.y += 1
            case "S":
                curPoint.y -= 1
            case "E":
                curPoint.x += 1
            case "W":
                curPoint.x -= 1
            default:
                fatalError()
            }
            if !visited.insert(curPoint).inserted {
                return true
            }
        }
        return false
    }
}

