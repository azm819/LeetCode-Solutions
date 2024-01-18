class Solution {
    private static var memo = [1]

    func numTilings(_ n: Int) -> Int {
        guard n >= .zero else { return .zero }
        if n < Solution.memo.count {
            return Solution.memo[n]
        }

        var result = numTilings(n - 1) + numTilings(n - 2)
        result %= 1_000_000_007
        if n >= 3 {
            for i in 3 ... n {
                result += 2 * numTilings(n - i)
                result %= 1_000_000_007
            }
        }
        Solution.memo.append(result)
        return result
    }
}

