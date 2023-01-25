class Solution {
    private func dfs(
        _ edges: [Int],
        _ cur: Int,
        _ curD: Int,
        _ distances: inout [Int]
    ) {
        guard distances[cur] == -1 || distances[cur] > curD else { return }
        distances[cur] = curD
        if edges[cur] != -1 {
            dfs(edges, edges[cur], distances[cur] + 1, &distances)
        }
    }

    func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
        var fromNode1 = Array(repeating: -1, count: edges.count)
        var fromNode2 = Array(repeating: -1, count: edges.count)
        dfs(edges, node1, .zero, &fromNode1)
        dfs(edges, node2, .zero, &fromNode2)
        var result = -1
        var minD: Int = .max
        print(fromNode1)
        print(fromNode2)
        for i in 0..<edges.count where fromNode1[i] != -1 && fromNode2[i] != -1 {
            let val = max(fromNode1[i], fromNode2[i])
            if val < minD {
                minD = val
                result = i
            }
        }
        return result
    }
}
