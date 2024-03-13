class Solution {
    func pivotInteger(_ n: Int) -> Int {
        var leftSum = (1 ... n).reduce(0, +)
        var rightSum = 0
        var n = n
        while n >= 1 {
            rightSum += n
            if leftSum == rightSum {
                return n
            } else if leftSum < rightSum {
                break
            }
            leftSum -= n
            n -= 1
        }
        return -1
    }
}
