class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        var queue = [Int]()
        var reversedGraph = [Int: [Int]]()
        var degrees = graph.map(\.count)
        for i in 0..<graph.count {
            if graph[i].isEmpty {
                queue.append(i)
            } else {
                for node in graph[i] {
                    reversedGraph[node, default: []].append(i)
                }
            }
        }
        var result = [Int]()
        while let node = queue.popLast() {
            result.append(node)
            for neigh in reversedGraph[node, default: []] {
                degrees[neigh] -= 1
                if degrees[neigh] == .zero {
                    queue.append(neigh)
                }
            }
        }
        return result.sorted()
    }
}
