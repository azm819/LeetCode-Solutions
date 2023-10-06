class Solution {
    private static var results: [Int?] = {
        var results = Array(repeating: Int?.none, count: 58)
        results[2] = 1
        return results
    }()

    func integerBreak(_ n: Int) -> Int {
        if let result = Solution.results[n] {
            return result
        }

        var result: Int = .min
        for i in 1 ... n - 2 {
            result = max(result, max(i * (n - i), i * integerBreak(n - i)))
        }
        Solution.results[n] = result
        return result
    }
}

