class Solution {
    private func dp(_ cur: Int, _ days: Set<Int>, _ costs: [Int], _ memo: inout [Int: Int]) -> Int {
        guard cur < 366 else { return .zero }
        if let res = memo[cur] {
            return res
        }
        let res: Int
        if days.contains(cur) {
            res = min(
                costs[0] + dp(cur + 1, days, costs, &memo),
                min(
                    costs[1] + dp(cur + 7, days, costs, &memo),
                    costs[2] + dp(cur + 30, days, costs, &memo)
                )
            )
        } else {
            res = dp(cur + 1, days, costs, &memo)
        }
        memo[cur] = res
        return res
    }

    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        var memo = [Int: Int]()
        return dp(1, Set(days), costs, &memo)
    }
}
