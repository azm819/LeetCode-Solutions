class Solution {
    private struct Direction: OptionSet {
        let rawValue: Int

        static let none = Direction(rawValue: .zero)
        static let up = Direction(rawValue: 1 << 0)
        static let down = Direction(rawValue: 1 << 1)
        static let right = Direction(rawValue: 1 << 2)
        static let left = Direction(rawValue: 1 << 3)
    }

    private enum CellType: Equatable {
        case empty(Direction)
        case `guard`
        case wall
    }

    func countUnguarded(_ m: Int, _ n: Int, _ guards: [[Int]], _ walls: [[Int]]) -> Int {
        var grid = Array(repeating: Array(repeating: CellType.empty(.none), count: n), count: m)

        for wall in walls {
            grid[wall[0]][wall[1]] = .wall
        }

        for `guard` in guards {
            var ind = `guard`[0]
            while ind >= .zero, case let .empty(direction) = grid[ind][`guard`[1]], !direction.contains(.up) {
                grid[ind][`guard`[1]] = .empty(direction.union(.up))
                ind -= 1
            }

            ind = `guard`[0]
            while ind < m, case let .empty(direction) = grid[ind][`guard`[1]], !direction.contains(.down) {
                grid[ind][`guard`[1]] = .empty(direction.union(.down))
                ind += 1
            }

            ind = `guard`[1]
            while ind >= .zero, case let .empty(direction) = grid[`guard`[0]][ind], !direction.contains(.left) {
                grid[`guard`[0]][ind] = .empty(direction.union(.left))
                ind -= 1
            }

            ind = `guard`[1]
            while ind < n, case let .empty(direction) = grid[`guard`[0]][ind], !direction.contains(.right) {
                grid[`guard`[0]][ind] = .empty(direction.union(.right))
                ind += 1
            }

            grid[`guard`[0]][`guard`[1]] = .guard
        }

        var result = 0
        for row in grid {
            for cell in row where cell == .empty(.none) {
                result += 1
            }
        }

        return result
    }
}
