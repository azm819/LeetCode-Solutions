class Solution {
    private var changes = [Int: Int]()

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > .zero else {
            return .zero
        }
        if let change = changes[amount] {
            return change
        }
        var result = Int.max
        for coin in coins where coin <= amount {
            let curChange = coinChange(coins, amount - coin)
            if curChange != -1 {
                result = min(result, curChange)
            }
        }
        if result == .max {
            result = -1
        } else {
            result += 1
        }
        changes[amount] = result
        return result
    }
}
