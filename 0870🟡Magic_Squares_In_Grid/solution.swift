class Solution {
    private enum TraversalDirection {
        case clockwise
        case counterClockwise
    }

    private enum Direction {
        case left
        case right
        case up
        case down
    }

    private func next(after num: Int) -> Int {
        switch num {
        case 1: return 6
        case 2: return 9
        case 3: return 8
        case 4: return 3
        case 6: return 7
        case 7: return 2
        case 8: return 1
        case 9: return 4
        default: return -1
        }
    }

    private func checkSequence(_ i: Int, _ j: Int, _ grid: [[Int]], _ traversal: TraversalDirection) -> Bool {
        var direction: Direction
        switch traversal {
        case .clockwise:
            direction = .right
        case .counterClockwise:
            direction = .down
        }

        var i = i
        var j = j
        var steps = 0
        while steps < 8 {
            steps += 1

            switch direction {
            case .left:
                guard next(after: grid[i][j]) == grid[i][j - 1] else { return false }
                j -= 1
                if steps % 2 == .zero {
                    direction = .up
                }
            case .right:
                guard next(after: grid[i][j]) == grid[i][j + 1] else { return false }
                j += 1
                if steps % 2 == .zero {
                    switch traversal {
                    case .clockwise:
                        direction = .down
                    case .counterClockwise:
                        direction = .up
                    }
                }
            case .up:
                guard next(after: grid[i][j]) == grid[i - 1][j] else { return false }
                i -= 1
                if steps % 2 == .zero {
                    direction = .left
                }
            case .down:
                guard next(after: grid[i][j]) == grid[i + 1][j] else { return false }
                i += 1
                if steps % 2 == .zero {
                    switch traversal {
                    case .clockwise:
                        direction = .left
                    case .counterClockwise:
                        direction = .right
                    }
                }
            }
        }

        return true
    }

    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        guard grid.count >= 3 && grid[0].count >= 3 else { return .zero }

        var result = 0
        for i in 0 ..< grid.count - 2 {
            for j in 0 ..< grid[i].count - 2 where grid[i][j] % 2 == .zero && grid[i + 1][j + 1] == 5 &&
                (checkSequence(i, j, grid, .clockwise) || checkSequence(i, j, grid, .counterClockwise)) {
                result += 1
            }
        }

        return result
    }
}

