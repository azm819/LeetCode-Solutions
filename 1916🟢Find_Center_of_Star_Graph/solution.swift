class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        var appearedNodes = Set<Int>()
        for edge in edges {
            if !appearedNodes.insert(edge[0]).inserted {
                return edge[0]
            }
            if !appearedNodes.insert(edge[1]).inserted {
                return edge[1]
            }
        }

        fatalError()
    }
}

