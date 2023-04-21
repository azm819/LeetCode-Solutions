class Solution {
    func find(
        _ ind: Int,
        _ count: Int,
        _ curProfit: Int,
        _ minProfit: Int,
        _ n: Int,
        _ group: [Int],
        _ profit: [Int],
        _ memo: inout [[[Int?]]]
    ) -> Int {
        guard ind < group.count else {
            return curProfit >= minProfit ? 1 : 0
        }
        if let mem = memo[ind][count][curProfit] {
            return mem
        }
        var total = find(ind + 1, count, curProfit, minProfit, n, group, profit, &memo)
        if count + group[ind] <= n {
            total += find(ind + 1, count + group[ind], min(minProfit, curProfit + profit[ind]), minProfit, n, group, profit, &memo)
        }
        total %= 1_000_000_007
        memo[ind][count][curProfit] = total
        return total
    }

    func profitableSchemes(_ n: Int, _ minProfit: Int, _ group: [Int], _ profit: [Int]) -> Int {
        var memo = Array(
            repeating: Array(
                repeating: Array(
                    repeating: Optional<Int>.none,
                    count: 101
                ),
                count: 101
            ),
            count: 101
        )
        return find(.zero, .zero, .zero, minProfit, n, group, profit, &memo)
    }
}
