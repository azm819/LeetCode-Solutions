class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        var ind = 2
        let nums = nums.sorted(by: >)
        while ind < nums.count {
            if nums[ind - 2] < nums[ind - 1] + nums[ind] {
                return nums[ind - 2] + nums[ind - 1] + nums[ind]
            }
            ind += 1
        }
        return .zero
    }
}
