class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var degrees = Array(repeating: 0, count: n)
        var neighbours = Array(repeating: [Int](), count: n)
        for edge in edges {
            degrees[edge[0]] += 1
            degrees[edge[1]] += 1
            neighbours[edge[0]].append(edge[1])
            neighbours[edge[1]].append(edge[0])
        }


        var notVisited = Set<Int>(0 ..< n)
        while true {
            let singleDegreeNodes = notVisited.filter { degrees[$0] == 1 }

            if singleDegreeNodes.isEmpty { break }

            for node in singleDegreeNodes {
                for neighbour in neighbours[node] where notVisited.contains(neighbour) {
                    degrees[neighbour] -= 1
                }
            }

            singleDegreeNodes.forEach { notVisited.remove($0) }
        }

        var result = [Int]()
        for i in 0 ..< degrees.count where degrees[i] == 0 {
            result.append(i)
        }
        return result
    }
}
