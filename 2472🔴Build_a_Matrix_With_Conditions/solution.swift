class Solution {
    private func getIndices(_ k: Int, _ conditions: [[Int]]) -> [Int]? {
        var prevs = [Int: [Int]]()
        var degrees = Array(repeating: 0, count: k)
        for condition in conditions {
            let from = condition[0] - 1
            let to = condition[1] - 1
            prevs[to, default: []].append(from)
            degrees[from] += 1
        }

        var queue = [Int]()
        for i in 0 ..< degrees.count where degrees[i] == .zero {
            queue.append(i)
        }

        var index = k - 1
        var indices = Array(repeating: 0, count: k)
        while let number = queue.popLast() {
            indices[number] = index
            index -= 1
            for prev in prevs[number, default: []] {
                degrees[prev] -= 1
                if degrees[prev] == .zero {
                    queue.append(prev)
                }
            }
        }

        guard index == -1 else { return nil }

        return indices
    }

    func buildMatrix(_ k: Int, _ rowConditions: [[Int]], _ colConditions: [[Int]]) -> [[Int]] {
        guard let rowIndices = getIndices(k, rowConditions), let colIndices = getIndices(k, colConditions) else {
            return []
        }

        var result = Array(repeating: Array(repeating: 0, count: k), count: k)
        for i in 0 ..< k {
            result[rowIndices[i]][colIndices[i]] = i + 1
        }
        return result
    }
}

