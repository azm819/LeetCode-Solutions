class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        var rightSum = -nums[0]
        for num in nums {
            rightSum += num
        }
        var ind = 0
        var leftSum = 0
        while ind < nums.count && leftSum != rightSum {
            leftSum += nums[ind]
            if ind + 1 < nums.count {
                rightSum -= nums[ind + 1]
                ind += 1
            } else {
                return -1
            }
        }
        return ind
    }
}
