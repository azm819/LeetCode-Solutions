class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var edges = [Int: [Int]]()
        var topology = Array(repeating: 0, count: numCourses)
        for prerequisite in prerequisites {
            edges[prerequisite[1], default: []].append(prerequisite[0])
            topology[prerequisite[0]] += 1
        }
        var res = [Int]()
        var queue = topology.enumerated().filter { $0.element == .zero }.map { $0.offset }
        while let node = queue.popLast() {
            res.append(node)
            if let prer = edges[node] {
                for p in prer {
                    topology[p] -= 1
                    if topology[p] == .zero {
                        queue.append(p)
                    }
                }
            }
        }
        return res.count == numCourses ? res : []
    }
}
