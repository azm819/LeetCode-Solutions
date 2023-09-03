class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = nums.count - k % nums.count
        guard k > .zero else { return }
        nums = Array(nums[k...]) + Array(nums[..<k])
    }
}
