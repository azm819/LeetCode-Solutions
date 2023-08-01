class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        let costs = costs.sorted()
        var result = 0
        var curSum = 0
        for cost in costs {
            curSum += cost
            if curSum <= coins {
                result += 1
            }
        }
        return result
    }
}
