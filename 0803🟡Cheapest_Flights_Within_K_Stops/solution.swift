class Solution {
    private func dfs(
        _ cur: Int,
        _ curL: Int,
        _ curK: Int,
        _ edges: [[[Int]]],
        _ dst: Int,
        _ k: Int,
        _ result: inout [[Int]]
    ) {
        guard curK <= k && curL < result[cur][curK] else {
            return
        }
        var ind = curK
        while ind <= k {
            result[cur][ind] = min(result[cur][ind], curL)
            ind += 1
        }
        result[cur][curK] = curL
        guard cur != dst else { return }
        for edge in edges[cur] {
            dfs(
                edge[0],
                curL + edge[1],
                curL == .zero ? curK : curK + 1,
                edges,
                dst,
                k,
                &result
            )
        }
    }

    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var edges = Array(repeating: [[Int]](), count: n)
        for flight in flights {
            edges[flight[0]].append([flight[1], flight[2]])
        }
        var result = Array(repeating: Array(repeating: Int.max, count: k + 1), count: n)
        dfs(src, 0, 0, edges, dst, k, &result)
        let minimum = result[dst].min()!
        return minimum == Int.max ? -1 : minimum
    }
}
