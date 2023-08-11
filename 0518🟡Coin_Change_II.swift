class Solution {
    private func dp(_ amount: Int, _ coins: [Int], _ index: Int, _ memo: inout [[Int: Int]]) -> Int {
        if let mem = memo[index][amount] {
            return mem
        }
        guard index < coins.count else { return .zero }
        var result = dp(amount, coins, index + 1, &memo)
        if coins[index] <= amount {
            result += dp(amount - coins[index], coins, index, &memo)
        }
        memo[index][amount] = result
        return result
    }

    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var memo = Array(repeating: [0: 1], count: coins.count + 1)
        return dp(amount, coins, .zero, &memo)
    }
}
