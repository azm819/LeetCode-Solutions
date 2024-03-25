class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var result = [Int]()
        for num in nums {
            nums[num - 1] *= -1
            if nums[num - 1] > .zero {
                result.append(num)
            }
        }
        return result
    }
}
