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

    func numberOfGoodPaths(_ vals: [Int], _ edges: [[Int]]) -> Int {
        let n = vals.count
        guard n > 1 else { return 1 }
        var parents = [Int]()
        var ranks = [Int]()
        for i in 0..<n {
            parents.append(i)
            ranks.append(.zero)
        }
        var neighbours = [Int: [Int]]()
        for edge in edges {
            neighbours[edge[0], default: []].append(edge[1])
            neighbours[edge[1], default: []].append(edge[0])
        }
        let nodes = vals.enumerated().sorted { $0.element < $1.element }
        var curNodes = [Int]()
        var result = 0
        var lastVal: Int?
        let calcPaths = {
            for curNode in curNodes {
                for neighbour in neighbours[curNode, default: []] where vals[neighbour] <= vals[curNode] {
                    self.unionSets(neighbour, curNode, &parents, &ranks)
                }
            }
            var groups = [Int: Int]()
            for curNode in curNodes {
                groups[self.findSet(curNode, &parents), default: .zero] += 1
            }
            for groupCount in groups.values {
                result += groupCount * (groupCount + 1) / 2
            }
        }
        for node in nodes {
            if lastVal == node.element {
                curNodes.append(node.offset)
            } else {
                calcPaths()
                curNodes = [node.offset]
                lastVal = node.element
            }
        }
        calcPaths()
        return result
    }
}

