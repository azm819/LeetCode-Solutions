class Solution {
    private struct Path: OptionSet, Hashable {
        var rawValue: Int
    }

    func shortestPathLength(_ graph: [[Int]]) -> Int {
        var fullPath = Path()
        var queue = [(Int, Path)]()
        var visited = Array(repeating: Set<Path>(), count: graph.count)
        for i in 0 ..< graph.count {
            let path = Path(rawValue: 1 << i)
            queue.append((i, path))
            visited[i].insert(path)
            fullPath.insert(path)
        }
        var result = 0
        while !queue.isEmpty {
            var newQueue = [(Int, Path)]()
            for (i, path) in queue {
                if path == fullPath {
                    return result
                }
                for j in graph[i] {
                    let newPath = path.union(Path(rawValue: 1 << j))
                    if visited[j].insert(newPath).inserted {
                        newQueue.append((j, newPath))
                    }
                }
            }
            queue = newQueue
            result += 1
        }
        return -1
    }
}
