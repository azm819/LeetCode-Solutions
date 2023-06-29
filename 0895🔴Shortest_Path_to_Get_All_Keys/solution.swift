class Solution {
    private struct Keys: OptionSet, Hashable {
        let rawValue: Int

        private static let a = Keys(rawValue: 1 << 0)
        private static let b = Keys(rawValue: 1 << 1)
        private static let c = Keys(rawValue: 1 << 2)
        private static let d = Keys(rawValue: 1 << 3)
        private static let e = Keys(rawValue: 1 << 4)
        private static let f = Keys(rawValue: 1 << 5)
        static let none = Keys(rawValue: .zero)

        mutating func insert(_ key: Character) {
            switch key {
            case "a": insert(.a)
            case "b": insert(.b)
            case "c": insert(.c)
            case "d": insert(.d)
            case "e": insert(.e)
            case "f": insert(.f)
            default: break
            }
        }

        func canOpen(_ lock: Character) -> Bool {
            switch lock {
            case "A": return contains(.a)
            case "B": return contains(.b)
            case "C": return contains(.c)
            case "D": return contains(.d)
            case "E": return contains(.e)
            case "F": return contains(.f)
            default: return false
            }
        }
    }

    func shortestPathAllKeys(_ grid: [String]) -> Int {
        var charGrid = [[Character]]()
        var startI = 0
        var startJ = 0
        var resKeys: Keys = .none
        for i in 0 ..< grid.count {
            charGrid.append([])
            var ind = grid[i].startIndex
            var j = 0
            while ind < grid[i].endIndex {
                if grid[i][ind] == "@" {
                    startI = i
                    startJ = j
                }
                resKeys.insert(grid[i][ind])
                charGrid[i].append(grid[i][ind])
                ind = grid[i].index(after: ind)
                j += 1
            }
        }
        var visited = Array(repeating: Array(repeating: Set<Keys>(), count: charGrid[0].count), count: charGrid.count)
        var queue = [(startI, startJ, Keys.none)]
        var step = 0
        while !queue.isEmpty {
            var newQueue = [(Int, Int, Keys)]()

            while var (i, j, keys) = queue.popLast() {
                if charGrid[i][j] == "#" || visited[i][j].contains(keys) || charGrid[i][j].isUppercase && !keys.canOpen(charGrid[i][j]) {
                    continue
                }

                visited[i][j].insert(keys)

                if charGrid[i][j].isLowercase {
                    keys.insert(charGrid[i][j])
                    if keys == resKeys {
                        return step
                    }
                }

                if i > .zero {
                    newQueue.append((i - 1, j, keys))
                }
                if i < charGrid.count - 1 {
                    newQueue.append((i + 1, j, keys))
                }
                if j > .zero {
                    newQueue.append((i, j - 1, keys))
                }
                if j < charGrid[0].count - 1 {
                    newQueue.append((i, j + 1, keys))
                }
            }

            queue = newQueue
            step += 1
        }
        return -1
    }
}
