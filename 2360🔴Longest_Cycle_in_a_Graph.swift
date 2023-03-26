class Solution {
    private func helper(_ cur: Int, _ curDist: Int, _ edges: [Int], _ cnts: inout [Int]) -> Int {
        defer { cnts[cur] = -1 }
        guard cnts[cur] != -1 && edges[cur] != -1 else { return -1 }
        guard cnts[cur] == -2 else { return curDist - cnts[cur] }
        cnts[cur] = curDist
        return helper(edges[cur], curDist + 1, edges, &cnts)
    }

    func longestCycle(_ edges: [Int]) -> Int {
        var result = -1
        var cnts = Array(repeating: -2, count: edges.count)
        for i in 0..<edges.count {
            result = max(result, helper(i, 0, edges, &cnts))
        }
        return result
    }
}
