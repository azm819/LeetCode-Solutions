class Solution {
    private func dp(_ cur: Int, _ prev: Int, _ graph: inout [[(neigh: Int, dist: Int?, nodesCount: Int?)]]) -> (dist: Int, nodesCount: Int) {
        var resultDist = 0
        var resultNodesCount = 1

        for i in 0 ..< graph[cur].count where graph[cur][i].neigh != prev {
            if let dist = graph[cur][i].dist, let nodesCount = graph[cur][i].nodesCount {
                resultDist += dist + nodesCount
                resultNodesCount += nodesCount
            } else {
                let (dist, nodesCount) = dp(graph[cur][i].neigh, cur, &graph)
                graph[cur][i] = (neigh: graph[cur][i].neigh, dist: dist, nodesCount: nodesCount)

                resultDist += dist + nodesCount
                resultNodesCount += nodesCount
            }
        }

        return (resultDist, resultNodesCount)
    }

    func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var graph = Array(repeating: [(neigh: Int, dist: Int?, nodesCount: Int?)](), count: n)

        for edge in edges {
            graph[edge[0]].append((neigh: edge[1], dist: nil, nodesCount: nil))
            graph[edge[1]].append((neigh: edge[0], dist: nil, nodesCount: nil))
        }

        return (0 ..< n).map {
            dp($0, -1, &graph).dist
        }
    }
}
