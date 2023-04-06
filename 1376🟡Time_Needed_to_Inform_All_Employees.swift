class Solution {
    private func numOfMinutes(_ cur: Int, _ edges: [Int: [Int]], _ informTime: [Int]) -> Int {
        guard let empls = edges[cur] else { return .zero }
        return (empls.map { numOfMinutes($0, edges, informTime) }.max() ?? .zero) + informTime[cur]
    }

    func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        var edges = [Int: [Int]]()
        for i in 0..<manager.count {
            edges[manager[i], default: []].append(i)
        }
        return numOfMinutes(headID, edges, informTime)
    }
}
