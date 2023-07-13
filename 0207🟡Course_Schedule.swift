class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var degrees = Array(repeating: 0, count: numCourses)
        var reversedGraph = [Int: [Int]]()
        for prerequisite in prerequisites {
            degrees[prerequisite[0]] += 1
            reversedGraph[prerequisite[1], default: []].append(prerequisite[0])
        }
        var queue = degrees
            .enumerated()
            .filter { $0.element == .zero }
            .map(\.offset)

        while let course = queue.popLast() {
            for neigh in reversedGraph[course, default: []] {
                degrees[neigh] -= 1
                if degrees[neigh] == .zero {
                    queue.append(neigh)
                }
            }
        }

        return degrees.allSatisfy { $0 == .zero }
    }
}
