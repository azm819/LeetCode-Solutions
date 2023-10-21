class Solution {
    func constrainedSubsetSum(_ nums: [Int], _ k: Int) -> Int {
        var dp = nums
        var queue = [Int]()
        var frontInd = 0
        for i in 0 ..< nums.count {
            if frontInd < queue.count && i - queue[frontInd] > k {
                frontInd += 1
            }
            if frontInd < queue.count {
                dp[i] = max(dp[i], dp[queue[frontInd]] + nums[i])
            }
            while let last = queue.last, dp[last] < dp[i] {
                queue.removeLast()
            }
            if frontInd >= queue.count {
                queue.removeAll()
                frontInd = 0
            }
            if dp[i] > .zero {
                queue.append(i)
            }
        }
        return dp.max()!
    }
}
