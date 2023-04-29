class Solution {
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

    func distanceLimitedPathsExist(_ n: Int, _ edgeList: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var parents = [Int]()
        var ranks = [Int]()
        for i in 0..<n {
            parents.append(i)
            ranks.append(.zero)
        }
        let edges = edgeList.sorted { $0[2] < $1[2] }
        let queries = queries.enumerated().sorted { $0.element[2] < $1.element[2] }
        var results = Array(repeating: false, count: queries.count)
        var ind = 0
        for (offset, query) in queries {
            while ind < edges.count && edges[ind][2] < query[2] {
                unionSets(edges[ind][0], edges[ind][1], &parents, &ranks)
                ind += 1
            }
            results[offset] = findSet(query[0], &parents) == findSet(query[1], &parents)
        }
        return results
    }
}

