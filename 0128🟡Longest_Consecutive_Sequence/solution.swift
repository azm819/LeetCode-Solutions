class Solution {
    @discardableResult
    private func findSet(_ v: Int, _ parents: inout [Int: Int]) -> Int {
        if parents[v] == v {
            return v
        }
        let parent = findSet(parents[v]!, &parents)
        parents[v] = parent
        return parent
    }

    private func unionSets(_ a: Int, _ b: Int, _ parents: inout [Int: Int], _ ranks: inout [Int: Int]) {
        guard parents[a] != nil && parents[b] != nil else { return }
        let aS = findSet(a, &parents)
        let bS = findSet(b, &parents)
        if aS != bS {
            let minR: Int
            let maxR: Int
            if ranks[aS]! < ranks[bS]! {
                minR = aS
                maxR = bS
            } else {
                minR = bS
                maxR = aS
            }
            parents[minR] = maxR
            if ranks[minR] == ranks[maxR] {
                ranks[maxR, default: .zero] += 1
            }
        }
    }

    func longestConsecutive(_ nums: [Int]) -> Int {
        var parents = [Int: Int]()
        var ranks = [Int: Int]()
        for num in nums where parents[num] == nil {
            parents[num] = num
            ranks[num] = .zero
            unionSets(num, num - 1, &parents, &ranks)
            unionSets(num, num + 1, &parents, &ranks)
        }
        var result = 0
        var counts = [Int: Int]()
        for num in parents.keys {
            let set = findSet(num, &parents)
            counts[set, default: .zero] += 1
            result = max(result, counts[set]!)
        }
        return result
    }
}

