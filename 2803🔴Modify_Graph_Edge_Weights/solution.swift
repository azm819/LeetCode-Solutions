class Solution {
    private static let maxDistance = 1_000_000_000 * 2

    private func calcDistance(
        _ cur: Int,
        _ distance: Int,
        _ graph: [[Int]],
        _ distances: inout [Int]
    ) {
        guard distances[cur] >= distance else {
            return
        }

        distances[cur] = distance
        for i in 0 ..< graph[cur].count where graph[cur][i] != .max {
            calcDistance(
                i,
                distance + graph[cur][i],
                graph,
                &distances
            )
        }
    }

    func modifiedGraphEdges(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int, _ target: Int) -> [[Int]] {
        var graph: [[Int]] = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        for edge in edges where edge[2] > .zero {
            graph[edge[0]][edge[1]] = edge[2]
            graph[edge[1]][edge[0]] = edge[2]
        }

        var distances = Array(repeating: Int.max, count: n)

        calcDistance(source, .zero, graph, &distances)

        guard distances[destination] >= target else {
            return []
        }

        guard distances[destination] > target else {
            return edges.map { $0[2] == -1 ? [$0[0], $0[1], Solution.maxDistance] : $0 }
        }

        let newEdges = edges.map { edge in
            guard edge[2] == -1 else {
                return edge
            }

            guard distances[destination] != target else {
                return [edge[0], edge[1], Solution.maxDistance]
            }

            graph[edge[0]][edge[1]] = 1
            graph[edge[1]][edge[0]] = 1

            calcDistance(source, .zero, graph, &distances)

            if distances[destination] <= target {
                let edgeDistance = 1 + target - distances[destination]
                distances[destination] = target
                graph[edge[0]][edge[1]] = edgeDistance
                graph[edge[1]][edge[0]] = edgeDistance
                return [edge[0], edge[1], edgeDistance]
            } else {
                return [edge[0], edge[1], 1]
            }
        }

        return distances[destination] == target ? newEdges : []
    }
}
