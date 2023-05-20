class Solution {
    private func dfs(
        _ cur: String,
        _ target: String,
        _ curCoef: Double,
        _ edges: [String: [String: Double]],
        _ visited: inout Set<String>
    ) -> Double? {
        guard let curEdges = edges[cur] else { return -1}
        guard cur != target else { return curCoef }
        visited.insert(cur)
        for edge in curEdges where !visited.contains(edge.key) {
            if let result = dfs(edge.key, target, curCoef * edge.value, edges, &visited) {
                return result
            }
        }
        return nil
    }

    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var edges = [String: [String: Double]]()
        for i in 0..<equations.count {
            let a = equations[i][0]
            let b = equations[i][1]
            edges[a, default: [String : Double]()][b] = values[i]
            edges[b, default: [String : Double]()][a] = 1 / values[i]
        }
        return queries.map { query in
            var visited = Set<String>()
            return dfs(query[0], query[1], 1, edges, &visited) ?? -1
        }
    }
}
