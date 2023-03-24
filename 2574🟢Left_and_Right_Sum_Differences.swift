class Solution {
    func leftRigthDifference(_ nums: [Int]) -> [Int] {
        var rightSum = nums.reduce(0, +)
        var leftSum = 0
        return nums.map { num in
            rightSum -= num
            defer { leftSum += num }
            return abs(leftSum - rightSum)
        }
    }
}
