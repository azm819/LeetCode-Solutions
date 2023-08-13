class Solution {
    func dp(_ nums: [Int], _ ind: Int, _ memo: inout [Bool?]) -> Bool {
        guard ind < nums.count else {
            return true
        }

        if let mem = memo[ind] {
            return mem
        }

        if nums.count - ind >= 2 &&
           nums[ind] == nums[ind + 1] &&
           dp(nums, ind + 2, &memo) {
            memo[ind] = true
            return true
        }

        if nums.count - ind >= 3 &&
           (nums[ind] == nums[ind + 1] && nums[ind + 1] == nums[ind + 2] || nums[ind] + 1 == nums[ind + 1] && nums[ind + 1] + 1 == nums[ind + 2]) &&
           dp(nums, ind + 3, &memo) {
            memo[ind] = true
            return true
        }

        memo[ind] = false
        return false
    }

    func validPartition(_ nums: [Int]) -> Bool {
        var memo = Array(repeating: Optional<Bool>.none, count: nums.count)
        return dp(nums, .zero, &memo)
    }
}
