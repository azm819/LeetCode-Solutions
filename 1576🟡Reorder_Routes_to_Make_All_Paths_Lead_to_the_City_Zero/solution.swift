class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var edges = [Int: [(Int, Bool)]]()
        for connection in connections {
            edges[connection[0], default: []].append((connection[1], true))
            edges[connection[1], default: []].append((connection[0], false))
        }
        var result = 0
        var queue = [0]
        var notVisited = Array(repeating: true, count: n)
        notVisited[0] = false
        while let node = queue.popLast() {
            if let edges = edges[node] {
                for (nextNode, isRev) in edges where notVisited[nextNode] {
                    if isRev {
                        result += 1
                    }
                    queue.append(nextNode)
                    notVisited[nextNode] = false
                }
            }
        }
        return result
    }
}
