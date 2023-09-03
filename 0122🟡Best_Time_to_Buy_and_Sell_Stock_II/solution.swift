class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return .zero }
        var result = 0
        for i in 1 ..< prices.count where prices[i] > prices[i - 1] {
            result += prices[i] - prices[i - 1]
        }
        return result
    }
}
