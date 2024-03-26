class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        var ind = 0
        while ind < nums.count {
            if nums[ind] > 0 && nums[ind] <= nums.count && nums[ind] != nums[nums[ind] - 1] {
                nums.swapAt(ind, nums[ind] - 1)
            } else {
                ind += 1
            }
        }

        for i in 0 ..< nums.count where nums[i] != i + 1 {
            return i + 1
        }
        return nums.count + 1
    }
}

