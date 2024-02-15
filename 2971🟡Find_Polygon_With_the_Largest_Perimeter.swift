class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let nums = nums.sorted(by: >)
        var sum = nums.reduce(0, +)
        for i in 0 ..< nums.count - 2 {
            sum -= nums[i]
            if nums[i] < sum {
                return nums[i] + sum
            }
        }
        return -1
    }
}
