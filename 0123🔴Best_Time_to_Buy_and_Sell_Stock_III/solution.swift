class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var firstDeals = Array(repeating: 0, count: prices.count)
        var lastMin: Int = .max
        var curRes = 0
        for i in 0 ..< prices.count {
            lastMin = min(lastMin, prices[i])
            curRes = max(curRes, prices[i] - lastMin)
            firstDeals[i] = curRes
        }

        var secondDeals = Array(repeating: 0, count: prices.count)
        var lastMax: Int = .min
        curRes = 0
        var i = prices.count - 1
        while i >= .zero {
            lastMax = max(lastMax, prices[i])
            curRes = max(curRes, lastMax - prices[i])
            secondDeals[i] = curRes
            i -= 1
        }

        var result = 0
        for i in 0 ..< prices.count {
            result = max(result, firstDeals[i] + secondDeals[i])
        }
        return result
    }
}

