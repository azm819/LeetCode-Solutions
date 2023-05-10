class Solution {
    private enum Direction {
        case up
        case down
        case left
        case right

        func next() -> Direction {
            switch self {
            case .up:
                return .right
            case .down:
                return .left
            case .left:
                return .up
            case .right:
                return .down
            }
        }
    }

    @discardableResult
    private func dfs(
        _ i: Int,
        _ j: Int,
        _ matrix: inout [[Int]],
        _ curVal: Int,
        _ visited: inout [[Bool]],
        _ direction: Direction
    ) -> Bool {
        if i < 0 || j < 0 || i >= matrix.count || j >= matrix[0].count || visited[i][j] {
            return false
        }
        matrix[i][j] = curVal
        visited[i][j] = true
        var cD = direction
        while true {
            let newI: Int
            let newJ: Int
            switch cD {
            case .up:
                newI = i + 1
                newJ = j
            case .down:
                newI = i - 1
                newJ = j
            case .left:
                newI = i
                newJ = j - 1
            case .right:
                newI = i
                newJ = j + 1
            }
            if dfs(newI, newJ, &matrix, curVal + 1, &visited, cD) {
                break
            }
            cD = cD.next()
            if cD == direction {
                break
            }
        }
        return true
    }

    func generateMatrix(_ n: Int) -> [[Int]] {
        var visited = Array(repeating: Array(repeating: false, count: n), count: n)
        var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
        dfs(0, 0, &matrix, 1, &visited, .right)
        return matrix
    }
}
