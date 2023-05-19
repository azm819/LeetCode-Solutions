class Solution {
    private func dfs(
        _ graph: [[Int]],
        _ curNode: Int,
        _ curCol: Bool,
        _ colors: inout [Bool?]
    ) -> Bool {
        if let color = colors[curNode] {
            return color == curCol
        }
        colors[curNode] = curCol
        for node in graph[curNode] {
            if !dfs(graph, node, !curCol, &colors) {
                return false
            }
        }
        return true
    }

    func isBipartite(_ graph: [[Int]]) -> Bool {
        var colors = Array(repeating: Optional<Bool>.none, count: graph.count)
        for i in 0..<graph.count where colors[i] == nil {
            if !dfs(graph, i, true, &colors) {
                return false
            }
        }
        return true
    }
}
