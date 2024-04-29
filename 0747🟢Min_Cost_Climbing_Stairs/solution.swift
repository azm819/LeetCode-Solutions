class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var a = 0
        var b = 0
        for step in cost {
            let c = a
            a = b
            b = min(b, c) + step
        }
        return min(a, b)
    }
}
