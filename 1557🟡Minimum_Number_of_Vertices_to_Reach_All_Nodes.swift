class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var hasNoIncome = Array(repeating: true, count: n)
        for edge in edges {
            hasNoIncome[edge[1]] = false
        }

        return hasNoIncome.enumerated().filter(\.element).map(\.offset)
    }
}
