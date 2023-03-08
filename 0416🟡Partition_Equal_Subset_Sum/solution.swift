class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        var totalSum = 0
        var maxNum = 0
        for num in nums {
            maxNum = max(maxNum, num)
            totalSum += num
        }
        guard totalSum % 2 == .zero else { return false }
        let targetSum = totalSum / 2
        guard maxNum < targetSum else { return maxNum == targetSum }
        var sumDist = Array(repeating: false, count: targetSum + 1)
        sumDist[0] = true
        for num in nums {
            for i in stride(from: targetSum - num, through: .zero, by: -1) where sumDist[i] {
                sumDist[i + num] = true
            }
        }
        return sumDist[targetSum]
    }
}
