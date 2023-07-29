class Solution {
    private static var memo = [Int: [Int: Double]]()

    private static func dp(_ soupA: Int, _ soupB: Int) -> Double {
        guard soupA > .zero && soupB > .zero else {
            if soupA <= .zero {
                return soupB <= .zero ? 0.5 : 1
            }
            return 0
        }
        if let mem = memo[soupA]?[soupB] {
            return mem
        }
        var result: Double = .zero
        result += dp(soupA - 4, soupB) / 4
        result += dp(soupA - 3, soupB - 1) / 4
        result += dp(soupA - 2, soupB - 2) / 4
        result += dp(soupA - 1, soupB - 3) / 4
        memo[soupA, default: [:]][soupB] = result
        return result
    }

    func soupServings(_ n: Int) -> Double {
        guard n < 5000 else { return 1 }
        let servings = n / 25 + (n % 25 > 0 ? 1 : 0)
        return Solution.dp(servings, servings)
    }
}
