class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        var ans = nums[0] + nums[1] + nums[2]
        var curDiff = abs(target - ans)
        let lastInd = nums.count - 1
        for i in 0...lastInd-2 {
            var left = i + 1
            var right = lastInd
            while left < right {
                let newSum = nums[i] + nums[left] + nums[right]
                let newDiff = abs(target - newSum)
                if curDiff > newDiff {
                    ans = newSum
                    curDiff = newDiff
                }
                if curDiff == .zero {
                    return ans
                }
                if newSum > target {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return ans
    }
}
