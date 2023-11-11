class Graph {
    private let n: Int
    private var dists: [[Int]]

    init(_ n: Int, _ edges: [[Int]]) {
        self.n = n
        dists = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        
        for i in 0 ..< n {
            dists[i][i] = .zero
        }

        for edge in edges {
            dists[edge[0]][edge[1]] = min(dists[edge[0]][edge[1]], edge[2])
        }
        for k in 0 ..< n {
            for i in 0 ..< n where dists[i][k] != .max {
                for j in 0 ..< n where dists[k][j] != .max {
                    dists[i][j] = min(dists[i][j], dists[i][k] + dists[k][j])
                }
            }
        }
    }

    func addEdge(_ edge: [Int]) {
        dists[edge[0]][edge[1]] = min(dists[edge[0]][edge[1]], edge[2])
        for i in 0 ..< n where dists[i][edge[0]] != .max {
            for j in 0 ..< n where dists[edge[1]][j] != .max {
                dists[i][j] = min(dists[i][j], dists[i][edge[0]] + dists[edge[1]][j] + dists[edge[0]][edge[1]])
            }
        }
    }

    func shortestPath(_ node1: Int, _ node2: Int) -> Int {
        dists[node1][node2] == .max ? -1 : dists[node1][node2]
    }
}


/**
 * Your Graph object will be instantiated and called as such:
 * let obj = Graph(n, edges)
 * obj.addEdge(edge)
 * let ret_2: Int = obj.shortestPath(node1, node2)
 */
