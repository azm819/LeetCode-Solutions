class Solution {
    private func bfs(
        _ cur: Int,
        _ curD: Int,
        _ fromRed: Bool,
        _ redEdges: [Int: Set<Int>],
        _ blueEdges: [Int: Set<Int>],
        _ redDist: inout [Int],
        _ blueDist: inout [Int]
    ) {
        if fromRed {
            guard redDist[cur] == -1 || redDist[cur] > curD else { return }
            redDist[cur] = curD
            guard let tos = blueEdges[cur] else { return }
            for to in tos {
                bfs(to, curD + 1, false, redEdges, blueEdges, &redDist, &blueDist)
            }
        } else {
            guard blueDist[cur] == -1 || blueDist[cur] > curD else { return }
            blueDist[cur] = curD
            guard let tos = redEdges[cur] else { return }
            for to in tos {
                bfs(to, curD + 1, true, redEdges, blueEdges, &redDist, &blueDist)
            }
        }
    }

    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        var redDist = Array(repeating: -1, count: n)
        var blueDist = redDist
        var redE = [Int: Set<Int>]()
        for edge in redEdges {
            let from = edge[0]
            let to = edge[1]
            var set = redE[from, default: .init()]
            set.insert(to)
            redE[from] = set
        }
        var blueE = [Int: Set<Int>]()
        for edge in blueEdges {
            let from = edge[0]
            let to = edge[1]
            var set = blueE[from, default: .init()]
            set.insert(to)
            blueE[from] = set
        }
        bfs(.zero, .zero, true, redE, blueE, &redDist, &blueDist)
        bfs(.zero, .zero, false, redE, blueE, &redDist, &blueDist)
        return zip(redDist, blueDist).map { a, b in
            if a == -1 { return b }
            if b == -1 { return a }
            return min(a, b)
        }
    }
}
