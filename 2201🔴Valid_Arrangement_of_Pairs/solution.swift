class Solution {
    func validArrangement(_ pairs: [[Int]]) -> [[Int]] {
        var edges = [Int: [Int]]()
        var nodeDegrees = [Int: Int]()
        for pair in pairs {
            nodeDegrees[pair[0], default: .zero] += 1
            nodeDegrees[pair[1], default: .zero] -= 1
            edges[pair[0], default: []].append(pair[1])
        }

        var stack = [nodeDegrees.first { $0.value > .zero && $0.value % 2 == 1 }?.key ?? pairs[0][0]]
        var path = [Int]()
        while !stack.isEmpty {
            let node = stack.last!
            if edges[node]?.isEmpty ?? true {
                path.append(node)
                stack.removeLast()
            } else {
                stack.append(edges[node]!.last!)
                edges[node]?.removeLast()
            }
        }

        var result = [[Int]]()
        var ind = path.count - 1
        while ind > .zero {
            result.append([path[ind], path[ind - 1]])
            ind -= 1
        }
        return result
    }
}
