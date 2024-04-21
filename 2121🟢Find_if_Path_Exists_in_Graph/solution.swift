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

    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var parents = [Int]()
        var ranks = [Int]()
        for i in 0 ..< n {
            parents.append(i)
            ranks.append(.zero)
        }

        for edge in edges {
            unionSets(edge[0], edge[1], &parents, &ranks)
        }

        return findSet(source, &parents) == findSet(destination, &parents)
    }
}
