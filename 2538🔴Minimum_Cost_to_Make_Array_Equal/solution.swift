class Solution {
    private func calculate(
        _ numsAndCosts: [Zip2Sequence<[Int], [Int]>.Element],
        _ ind: Int,
        _ memo: inout [Int: Int]
    ) -> Int {
        let num = numsAndCosts[ind].0
        if let mem = memo[num] {
            return mem
        }
        var result = 0

        for numAndCost in numsAndCosts {
            result += numAndCost.1 * abs(num - numAndCost.0)
        }

        memo[num] = result
        return result
    }

    func minCost(_ nums: [Int], _ cost: [Int]) -> Int {
        let numsAndCosts = zip(nums, cost).sorted { lhs, rhs in
            lhs.0 < rhs.0
        }
        var memo = [Int: Int]()
        var l = 0
        var r = nums.count - 1
        while l < r {
            let a = (l * 2 + r) / 3
            let b = (l + r * 2 + 2) / 3
            let af = calculate(numsAndCosts, a, &memo)
            let bf = calculate(numsAndCosts, b, &memo)
            if af < bf {
                r = r == b ? r - 1 : b
            } else {
                l = l == a ? a + 1 : a
            }
        }
        return calculate(numsAndCosts, l, &memo)
    }
}
