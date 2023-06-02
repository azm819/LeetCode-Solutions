class Solution {
    private func dfs(
        _ cur: Int,
        _ edges: [Int: [Int]],
        _ visited: inout Set<Int>
    ) {
        visited.insert(cur)
        if let nodes = edges[cur] {
            for node in nodes where !visited.contains(node) {
                dfs(node, edges, &visited)
            }
        }
    }

    func maximumDetonation(_ bombs: [[Int]]) -> Int {
        guard bombs.count > 1 else { return 1 }
        var edges = [Int: [Int]]()
        for i in 0..<bombs.count - 1 {
            for j in i..<bombs.count {
                let dist = (bombs[i][0] - bombs[j][0]) * (bombs[i][0] - bombs[j][0]) + (bombs[i][1] - bombs[j][1]) * (bombs[i][1] - bombs[j][1])
                if dist <= bombs[i][2] * bombs[i][2] {
                    edges[i, default: []].append(j)
                }
                if dist <= bombs[j][2] * bombs[j][2] {
                    edges[j, default: []].append(i)
                }
            }
        }
        var result = 0
        for i in 0..<bombs.count {
            var visited = Set<Int>()
            dfs(i, edges, &visited)
            result = max(result, visited.count)
        }
        return result
    }
}

