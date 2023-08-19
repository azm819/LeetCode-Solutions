class Solution {
    @discardableResult
    private func findSet(_ v: Int, _ parents: inout [Int]) -> Int {
        if parents[v] == v {
            return v
        }
        let parent = findSet(parents[v], &parents)
        parents[v] = parent
        return parent
    }

    private func unionSets(_ a: Int, _ b: Int, _ parents: inout [Int], _ ranks: inout [Int]) {
        let aS = findSet(a, &parents)
        let bS = findSet(b, &parents)
        if aS != bS {
            let minR: Int
            let maxR: Int
            if ranks[aS] < ranks[bS] {
                minR = aS
                maxR = bS
            } else {
                minR = bS
                maxR = aS
            }
            parents[minR] = maxR
            if ranks[minR] == ranks[maxR] {
                ranks[maxR] += 1
            }
        }
    }

    private func mstWeight(
        _ n: Int,
        _ edges: [[Int]],
        _ include: Int?,
        _ exclude: Int?
    ) -> Int {
        var parents = [Int]()
        var ranks = [Int]()
        for i in 0 ..< n {
            parents.append(i)
            ranks.append(.zero)
        }
        var result = 0
        if let include = include {
            unionSets(edges[include][0], edges[include][1], &parents, &ranks)
            result += edges[include][2]
        }
        for i in 0 ..< edges.count where exclude != i && findSet(edges[i][0], &parents) != findSet(edges[i][1], &parents) {
            unionSets(edges[i][0], edges[i][1], &parents, &ranks)
            result += edges[i][2]
        }
        var commonParent = findSet(.zero, &parents)
        for i in 0 ..< n {
            if commonParent != findSet(i, &parents) {
                return .max
            }
        }
        return result
    }

    func findCriticalAndPseudoCriticalEdges(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        let sortedEdges = edges.enumerated().sorted { $0.element[2] < $1.element[2] }
        let edges = sortedEdges.map(\.element)

        let targetWeight = mstWeight(n, edges, nil, nil)

        var result = [[Int](), [Int]()]
        var isCritical = Array(repeating: false, count: edges.count)
        for i in 0 ..< edges.count where mstWeight(n, edges, nil, i) != targetWeight {
            isCritical[i] = true
            result[0].append(sortedEdges[i].offset)
        }
        for i in 0 ..< edges.count where !isCritical[i] && mstWeight(n, edges, i, nil) == targetWeight {
            result[1].append(sortedEdges[i].offset)
        }
        return result
    }
}

