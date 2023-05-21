class Solution {
    private func resign(_ first: Int, _ second: Int, _ grid: inout [[Int]]) {
        guard first >= .zero && first < grid.count else { return }
        guard second >= .zero && second < grid[0].count else { return }
        guard grid[first][second] == 1 else { return }
        grid[first][second] = 2
        resign(first - 1, second, &grid)
        resign(first + 1, second, &grid)
        resign(first, second - 1, &grid)
        resign(first, second + 1, &grid)
    }

    private struct Node: Hashable {
        let a: Int
        let b: Int
        let dist: Int

        init(a: Int, b: Int, dist: Int = .zero) {
            self.a = a
            self.b = b
            self.dist = dist
        }
    }

    func shortestBridge(_ grid: [[Int]]) -> Int {
        var grid = grid
        var flag = false
        for i in 0..<grid.count {
            for j in 0..<grid[0].count where grid[i][j] == 1 {
                resign(i, j, &grid)
                flag.toggle()
                break
            }
            if flag { break }
        }

        var queue = Set<Node>()
        var notVisited = Array(repeating: Array(repeating: Int.max, count: grid[0].count), count: grid.count)
        for i in 0..<grid.count {
            for j in 0..<grid[0].count where grid[i][j] == 2 {
                queue.insert(Node(a: i, b: j))
                notVisited[i][j] = .zero
            }
        }

        var result: Int = .max
        let isNotVisited: (Int, Int, Int) -> Bool = { (i: Int, j: Int, dist: Int) in
            guard i >= .zero && i < grid.count else { return false }
            guard j >= .zero && j < grid[0].count else { return false }
            guard notVisited[i][j] > dist else { return false }
            notVisited[i][j] = dist
            return true
        }
        while let node = queue.popFirst() {
            let i = node.a
            let j = node.b
            let dist: Int?
            switch grid[i][j] {
            case 0:
                dist = node.dist + 1
            case 1:
                result = min(result, node.dist)
                dist = nil
            default:
                dist = node.dist
            }
            if let dist = dist {
                if isNotVisited(i - 1, j, dist) { queue.insert(Node(a: i - 1, b: j, dist: dist)) }
                if isNotVisited(i + 1, j, dist) { queue.insert(Node(a: i + 1, b: j, dist: dist)) }
                if isNotVisited(i, j - 1, dist) { queue.insert(Node(a: i, b: j - 1, dist: dist)) }
                if isNotVisited(i, j + 1, dist) { queue.insert(Node(a: i, b: j + 1, dist: dist)) }
            }
        }
        return result
    }
}
