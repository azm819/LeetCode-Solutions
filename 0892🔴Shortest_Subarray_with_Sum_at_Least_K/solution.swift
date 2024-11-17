class Solution {
    func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
        var result: Int = .max

        var stack: [(index: Int, sum: Int)] = []
        var curSum: Int = .zero
        for i in 0 ..< nums.count {
            curSum += nums[i]
            while let last = stack.last, last.sum >= curSum {
                stack.removeLast()
            }

            let target = curSum - k
            if target >= .zero {
                result = min(result, i + 1)
            }
            if let first = stack.first, target >= first.sum {
                var l = 0
                var r = stack.count - 1
                while l < r {
                    let m = (l + r + 1) / 2
                    if stack[m].sum > target {
                        r = m - 1
                    } else {
                        l = m
                    }
                }

                result = min(result, i - stack[l].index)
            }

            stack.append((index: i, sum: curSum))
        }

        return result == .max ? -1 : result
    }
}
