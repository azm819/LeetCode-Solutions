class Solution {
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        var edges = [Int: [Int]]()
        for connection in connections {
            edges[connection[0], default: []].append(connection[1])
            edges[connection[1], default: []].append(connection[0])
        }
        var groups = 0
        var notVisited = Array(repeating: true, count: n)
        var extraConnections = 0
        for i in 0..<n where notVisited[i] {
            groups += 1
            var queue = [(i, -1)]
            notVisited[i] = false
            while let (cur, from) = queue.popLast() {
                if let nodes = edges[cur] {
                    for node in nodes {
                        if notVisited[node] {
                            queue.append((node, cur))
                            notVisited[node] = false
                        } else if from != node {
                            extraConnections += 1
                        }
                    }
                }
            }
        }
        extraConnections /= 2
        edges.removeAll()
        let result = groups - 1
        return extraConnections < result ? -1 : result
    }
}
