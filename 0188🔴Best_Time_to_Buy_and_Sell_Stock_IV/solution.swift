class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        guard prices.count > 1 else { return .zero }
        var profit = Array(repeating: 0, count: prices.count)
        for _ in 1 ... k {
            var maxProfit: Int = .min
            var lastPosProfit = 0
            for i in 1 ..< prices.count {
                maxProfit = max(maxProfit, lastPosProfit - prices[i - 1])
                lastPosProfit = profit[i]
                profit[i] = max(profit[i - 1], prices[i] + maxProfit)
            }
        }
        return profit.last!
    }
}
