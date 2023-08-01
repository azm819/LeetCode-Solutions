class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        var counts = Array(repeating: 0, count: 100_001)
        for cost in costs {
            counts[cost] += 1
        }
        var result = 0
        var remainingCoins = coins
        for cost in 1 ... 100_000 {
            if remainingCoins < cost { break }
            let count = min(counts[cost], remainingCoins / cost)
            result += count
            remainingCoins -= count * cost
        }
        return result
    }
}
