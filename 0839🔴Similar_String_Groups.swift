class Solution {
    private func isSimilar(_ lhs: String, _ rhs: String) -> Bool {
        var ind = lhs.startIndex
        var diff = 0
        while ind < lhs.endIndex && diff <= 2 {
            if lhs[ind] != rhs[ind] {
                diff += 1
            }
            ind = lhs.index(after: ind)
        }
        return diff <= 2
    }

    func numSimilarGroups(_ strs: [String]) -> Int {
        guard strs[0].count > 1 else { return 1 }

        var parents = [Int]()
        var ranks = [Int]()
        for i in 0..<strs.count {
            parents.append(i)
            ranks.append(.zero)
        }

        for i in 0..<strs.count - 1 {
            for j in i..<strs.count where isSimilar(strs[i], strs[j]) {
                unionSets(i, j, &parents, &ranks)
            }
        }

        for i in 0..<strs.count {
            findSet(i, &parents)
        }

        return Set(parents).count
    }
}

private extension Solution {
    @discardableResult
    func findSet(_ v: Int, _ parents: inout [Int]) -> Int {
        if parents[v] == v {
            return v
        }
        let parent = findSet(parents[v], &parents)
        parents[v] = parent
        return parent
    }

    func unionSets(_ a: Int, _ b: Int, _ parents: inout [Int], _ ranks: inout [Int]) {
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
}
