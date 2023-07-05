class Solution {
    private func dfs(
        _ from: Int,
        _ cur: Int,
        _ neighbours: [Int: [Int]],
        _ hasApple: [Bool]
    ) -> Int {
        var result = 0
        var curHasApple = hasApple[cur]
        for neighbour in neighbours[cur, default: []] where neighbour != from {
            let subRes = dfs(cur, neighbour, neighbours, hasApple)
            if subRes > .zero {
                result += subRes
                curHasApple = true
            }
        }
        if curHasApple && cur != .zero {
            result += 1
        }
        return result
    }

    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        var neighbours = [Int: [Int]]()
        for edge in edges {
            neighbours[edge[0], default: []].append(edge[1])
            neighbours[edge[1], default: []].append(edge[0])
        }
        return dfs(.zero, .zero, neighbours, hasApple) * 2
    }
}
