class Solution {
    private func relax(
        _ cur: Int,
        _ curDistance: Int,
        _ edges: [[Int]],
        _ distances: inout [Int]
    ) {
        guard curDistance < distances[cur] else {
            return
        }
        distances[cur] = curDistance

        for node in edges[cur] {
            relax(node, curDistance + 1, edges, &distances)
        }
    }

    func shortestDistanceAfterQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        var distances = Array(repeating: Int.max, count: n)
        var edges = Array(repeating: [Int](), count: n)
        for i in 0 ..< n - 1 {
            edges[i].append(i + 1)
        }
        relax(.zero, .zero, edges, &distances)

        var answer = [Int]()
        for query in queries {
            edges[query[0]].append(query[1])
            relax(query[1], distances[query[0]] + 1, edges, &distances)
            answer.append(distances.last!)
        }
        return answer
    }
}

