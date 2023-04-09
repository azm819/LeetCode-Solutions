class Solution {
    func largestPathValue(_ colors: String, _ edges: [[Int]]) -> Int {
        let colors = Array(colors)
        var indegrees = Array(repeating: 0, count: colors.count)
        var queue = Set(0..<colors.count)
        var neighbours = [Int: [Int]]()
        for edge in edges {
            neighbours[edge[0], default: []].append(edge[1])
            indegrees[edge[1]] += 1
            queue.remove(edge[1])
        }
        var colorCounts = Array(repeating: [Character: Int](), count: colors.count)
        var result = 0
        var notVisitedCount = colors.count
        while let node = queue.popFirst() {
            notVisitedCount -= 1
            colorCounts[node][colors[node], default: .zero] += 1
            result = max(result, colorCounts[node][colors[node]]!)
            if let neighbours = neighbours[node] {
                for neighbour in neighbours {
                    indegrees[neighbour] -= 1
                    if indegrees[neighbour] == .zero {
                        queue.insert(neighbour)
                    }
                    for (color, count) in colorCounts[node] {
                        if let neighbourCount = colorCounts[neighbour][color] {
                            colorCounts[neighbour][color] = max(neighbourCount, count)
                        } else {
                            colorCounts[neighbour][color] = count
                        }
                    }
                }
            }
            neighbours[node] = nil
        }
        return notVisitedCount > .zero ? -1 : result
    }
}
