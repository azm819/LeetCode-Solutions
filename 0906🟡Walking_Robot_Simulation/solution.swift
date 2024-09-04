class Solution {
    private enum Direction {
        case north
        case east
        case south
        case west

        var turnedLeft: Direction {
            switch self {
            case .north:
                return .west
            case .east:
                return .north
            case .south:
                return .east
            case .west:
                return .south
            }
        }

        var turnedRight: Direction {
            switch self {
            case .north:
                return .east
            case .east:
                return .south
            case .south:
                return .west
            case .west:
                return .north
            }
        }
    }

    private struct Position: Hashable {
        let x: Int
        let y: Int
    }

    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var direction: Direction = .north

        var obstaclePositions: Set<Position> = Set(obstacles.map { Position(x: $0[0], y: $0[1]) })

        var curPosition = Position(x: .zero, y: .zero)
        var result: Int = .zero
        for var command in commands {
            switch command {
            case -2:
                direction = direction.turnedLeft
            case -1:
                direction = direction.turnedRight
            default:
                while command > .zero {
                    let newPosition: Position
                    switch direction {
                    case .north:
                        newPosition = Position(x: curPosition.x, y: curPosition.y + 1)
                    case .east:
                        newPosition = Position(x: curPosition.x + 1, y: curPosition.y)
                    case .south:
                        newPosition = Position(x: curPosition.x, y: curPosition.y - 1)
                    case .west:
                        newPosition = Position(x: curPosition.x - 1, y: curPosition.y)
                    }

                    guard !obstaclePositions.contains(newPosition) else {
                        break
                    }

                    curPosition = newPosition

                    command -= 1
                }

                result = max(result, curPosition.x * curPosition.x + curPosition.y * curPosition.y)
            }
        }

        return result
    }
}
