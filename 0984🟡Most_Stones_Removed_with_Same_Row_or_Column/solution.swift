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

    func removeStones(_ stones: [[Int]]) -> Int {
        let n = stones.count
        guard n > 1 else { return .zero }
        var parents = [Int]()
        var ranks = [Int]()
        for i in 0 ..< n {
            parents.append(i)
            ranks.append(.zero)
        }
        for i in 0 ..< n - 1 {
            for j in i + 1 ..< n where stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1] {
                unionSets(i, j, &parents, &ranks)
            }
        }
        for i in 0 ..< n {
            findSet(i, &parents)
        }
        return n - Set(parents).count
    }
}
