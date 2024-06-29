class Solution {
    func getAncestors(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        var ancestors = Array(repeating: Set<Int>(), count: n)
        var topCount = Array(repeating: 0, count: n)
        var children = Array(repeating: [Int](), count: n)
        for edge in edges {
            ancestors[edge[1]].insert(edge[0])
            topCount[edge[1]] += 1
            children[edge[0]].append(edge[1])
        }

        var zeroCountNodes = Set<Int>()
        for i in 0 ..< topCount.count where topCount[i] == .zero {
            zeroCountNodes.insert(i)
        }

        while let node = zeroCountNodes.popFirst() {
            var allAncestors = Set<Int>()
            for ancestor in ancestors[node] {
                allAncestors.insert(ancestor)
                allAncestors.formUnion(ancestors[ancestor])
            }
            ancestors[node] = allAncestors
            for child in children[node] {
                topCount[child] -= 1
                if topCount[child] == .zero {
                    zeroCountNodes.insert(child)
                }
            }
        }

        return ancestors.map { $0.sorted() }
    }
}
