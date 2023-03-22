class Solution {
    private func dfs(_ cur: Int, _ curDist: Int, _ dists: inout [Int], _ edges: [Int: [[Int]]]) {
        guard dists[cur] == -1 || curDist < dists[cur] else { return }
        dists[cur] = curDist
        if let nodes = edges[cur] {
            for node in nodes {
                dfs(node[0], min(curDist, node[1]), &dists, edges)
            }
        }
    }

    func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
        var edges = [Int: [[Int]]]()
        for road in roads {
            edges[road[0], default: []].append([road[1], road[2]])
            edges[road[1], default: []].append([road[0], road[2]])
        }
        var dists = Array(repeating: -1, count: n + 1)
        dfs(1, .max, &dists, edges)
        print(dists)
        return dists[n]
    }
}
