class Solution {
    private func numRollsToTarget(
        _ n: Int,
        _ k: Int,
        _ target: Int,
        _ memo: inout [Int: [Int: Int]]
    ) -> Int {
        guard n > .zero else {
            return target == .zero ? 1 : 0
        }

        if let mem = memo[n]?[target] {
            return mem
        }

        var result = 0
        for i in 1 ... min(target - n + 1, k) {
            result += numRollsToTarget(n - 1, k, target - i, &memo)
            result %= 1_000_000_007
        }
        memo[n, default: [:]][target] = result
        return result
    }

    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        guard target >= n else { return .zero }
        var memo = [Int: [Int: Int]]()
        return numRollsToTarget(n, k, target, &memo)
    }
}

