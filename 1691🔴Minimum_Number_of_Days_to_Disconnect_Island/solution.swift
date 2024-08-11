class Solution {
    private final class Node: Hashable {
        let i: Int
        let j: Int
        let grid: [[Int]]
        let parent: Node?

        init(i: Int, j: Int, grid: [[Int]], parent: Node?) {
            self.i = i
            self.j = j
            self.grid = grid
            self.parent = parent
        }

        static func == (lhs: Solution.Node, rhs: Solution.Node) -> Bool {
            lhs.i == rhs.i && lhs.j == rhs.j
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(i)
            hasher.combine(j)
        }

        var validChildren: [Node] {
            var neighbours: [Node] = []
            if i > .zero && grid[i - 1][j] == 1 {
                neighbours.append(Node(i: i - 1, j: j, grid: grid, parent: self))
            }
            if i < grid.count - 1 && grid[i + 1][j] == 1 {
                neighbours.append(Node(i: i + 1, j: j, grid: grid, parent: self))
            }
            if j > .zero && grid[i][j - 1] == 1 {
                neighbours.append(Node(i: i, j: j - 1, grid: grid, parent: self))
            }
            if j < grid[i].count - 1 && grid[i][j + 1] == 1 {
                neighbours.append(Node(i: i, j: j + 1, grid: grid, parent: self))
            }
            return neighbours
        }
    }

    private func findArticulationPoint(
        _ node: Node,
        _ times: inout [Node: (dest: Int, reachable: Int)],
        _ curTime: inout Int
    ) -> Bool {
        curTime += 1
        times[node] = (curTime, curTime)
        var hasArticulationPoint = false
        var childrenCount = 0
        for child in node.validChildren {
            if times[child] == nil {
                childrenCount += 1
                if findArticulationPoint(child, &times, &curTime) {
                    hasArticulationPoint = true
                }

                times[node]!.reachable = min(times[node]!.reachable, times[child]!.reachable)

                if node.parent != nil && times[child]!.reachable >= times[node]!.dest {
                    hasArticulationPoint = true
                }
            } else if node.parent != child {
                times[node]!.reachable = min(times[node]!.reachable, times[child]!.reachable)
            }
        }

        if node.parent == nil && childrenCount != 1 {
            hasArticulationPoint = true
        }

        return hasArticulationPoint
    }

    func minDays(_ grid: [[Int]]) -> Int {
        var times: [Node: (dest: Int, reachable: Int)] = [:]
        var wasIterated = false
        var hasArticulationPoint = false
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[i].count where grid[i][j] == 1 {
                let node = Node(i: i, j: j, grid: grid, parent: nil)
                if times[node] != nil { continue }
                if wasIterated {
                    return 0
                }

                var curTime: Int = .zero
                hasArticulationPoint = findArticulationPoint(node, &times, &curTime)

                wasIterated = true
            }
        }

        if wasIterated {
            return hasArticulationPoint ? 1 : 2
        } else {
            return 0
        }
    }
}
