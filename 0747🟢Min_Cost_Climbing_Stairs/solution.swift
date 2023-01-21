class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        guard cost.count > 2 else {
            return min(cost[0], cost[1])
        }
        var a = cost[0]
        var b = cost[1]
        for i in 2..<cost.count {
            let c = a
            a = b
            b = min(b, c) + cost[i]
        }
        return min(a, b)
    }
}
