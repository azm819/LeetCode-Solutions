class Solution {
    func secondMinimum(_ n: Int, _ edges: [[Int]], _ time: Int, _ change: Int) -> Int {
        var graph: [Int: [Int]] = [:]
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            graph[u, default: []].append(v)
            graph[v, default: []].append(u)
        }

        var curNodes: Set<Int> = [1]
        var curTime: Int = .zero
        var visitedTimes: [Int] = Array(repeating: .zero, count: n + 1)
        visitedTimes[1] = 1
        while true {
            if (curTime / change) % 2 == 1 {
                curTime = (curTime / change + 1) * change
            }
            curTime += time

            var newNodes: Set<Int> = []
            for node in curNodes {
                for nextNode in graph[node, default: []] where !newNodes.contains(nextNode) {
                    switch visitedTimes[nextNode] {
                    case 0:
                        visitedTimes[nextNode] = 1
                        newNodes.insert(nextNode)
                    case 1:
                        if nextNode == n {
                            return curTime
                        }
                        visitedTimes[nextNode] = 2
                        newNodes.insert(nextNode)
                    default:
                        break
                    }
                }
            }
            curNodes = newNodes
        }
    }
}
