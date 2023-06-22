class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var free = 0
        var hold = -prices[0]
        for price in prices {
            let tmp = free
            free = max(free, hold + price - fee)
            hold = max(hold, tmp - price)
        }
        return free
    }
}
