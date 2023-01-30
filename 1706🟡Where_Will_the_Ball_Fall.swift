class Solution {
    private enum Direction {
        case up
        case left
        case right
    }

    private struct Item: Hashable {
        let i: Int
        let j: Int
        let dir: Direction

        func next(_ borderType: Int) -> Item? {
            switch self.dir {
            case .up:
                return borderType == 1 ? Item(i: i, j: j + 1, dir: .left) : Item(i: i, j: j - 1, dir: .right)
            case .left:
                return borderType == 1 ? Item(i: i + 1, j: j, dir: .up) : nil
            case .right:
                return borderType == 1 ? nil : Item(i: i + 1, j: j, dir: .up)
            }
        }
    }

    private var cache = [Item: Int]()

    private func findPath(_ grid: [[Int]], _ item: Item) -> Int {
        if let ans = cache[item] {
            return ans
        }
        guard item.j >= .zero && item.j < grid[0].count else { return -1 }
        if item.i == grid.count { return item.j }
        guard let to = item.next(grid[item.i][item.j]) else {
            cache[item] = -1
            return -1
        }
        let ans = findPath(grid, to)
        cache[item] = ans
        return ans
    }

    func findBall(_ grid: [[Int]]) -> [Int] {
        let ans = (0..<grid[0].count).map {
            findPath(grid, Item(i: 0, j: $0, dir: .up))
        }
        return ans
    }
}
