class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return .zero }
        var profit = 0
        var lastMin = prices[0]
        for price in prices {
            if price - lastMin > profit {
                profit = price - lastMin
            } else if price < lastMin {
                lastMin = price
            }
        }
        return profit
    }
}
