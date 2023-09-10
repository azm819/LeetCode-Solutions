class Solution {
    private static var counts = [1]

    func countOrders(_ n: Int) -> Int {
        let prevN = n - 1
        guard n > Solution.counts.count else { return Solution.counts[prevN] }
        let prevCount = countOrders(prevN)
        var result = 0
        let positions = 2 * prevN + 1
        for i in 0 ..< positions {
            result += (positions - i) * prevCount % 1_000_000_007
            result %= 1_000_000_007
        }
        Solution.counts.append(result)
        return result
    }
}

