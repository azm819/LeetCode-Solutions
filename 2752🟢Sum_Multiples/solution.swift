class Solution {
    private static var memo: [Int] = []

    func sumOfMultiples(_ n: Int) -> Int {
        guard n >= .zero else { return .zero }

        if Solution.memo.count > n {
            return Solution.memo[n]
        }

        var result = sumOfMultiples(n - 1)
        if n % 3 == .zero || n % 5 == .zero || n % 7 == .zero {
            result += n
        }
        Solution.memo.append(result)
        return result
    }
}
