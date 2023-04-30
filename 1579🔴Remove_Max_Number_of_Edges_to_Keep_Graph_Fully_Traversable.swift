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

    func maxNumEdgesToRemove(_ n: Int, _ edges: [[Int]]) -> Int {
        var parentsA = [Int]()
        var ranksA = [Int]()
        var parentsB = [Int]()
        var ranksB = [Int]()
        for i in 0...n {
            parentsA.append(i)
            ranksA.append(.zero)
            parentsB.append(i)
            ranksB.append(.zero)
        }

        var res = 0
        for edge in edges where edge[0] == 3 {
            var isRequired = false
            if findSet(edge[1], &parentsA) != findSet(edge[2], &parentsA) {
                unionSets(edge[1], edge[2], &parentsA, &ranksA)
                isRequired = true
            }
            if findSet(edge[1], &parentsB) != findSet(edge[2], &parentsB) {
                unionSets(edge[1], edge[2], &parentsB, &ranksB)
                isRequired = true
            }
            if isRequired {
                res += 1
            }
        }

        for edge in edges {
            if edge[0] == 1 {
                if findSet(edge[1], &parentsA) != findSet(edge[2], &parentsA) {
                    unionSets(edge[1], edge[2], &parentsA, &ranksA)
                    res += 1
                }
            }
            if edge[0] == 2 {
                if findSet(edge[1], &parentsB) != findSet(edge[2], &parentsB) {
                    unionSets(edge[1], edge[2], &parentsB, &ranksB)
                    res += 1
                }
            }
        }

        let parentA = findSet(1, &parentsA)
        let parentB = findSet(1, &parentsB)
        for i in 1...n {
            if parentA != findSet(i, &parentsA) || parentB != findSet(i, &parentsB) {
                return -1
            }
        }

        return edges.count - res
    }
}
