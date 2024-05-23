class Solution {
    private func backtrack(_ ind: Int, _ nums: [Int], _ k: Int, _ subset: inout Set<Int>) -> Int {
        guard ind < nums.count else {
            return subset.isEmpty ? 0 : 1
        }

        if subset.contains(nums[ind]) {
            return 2 * backtrack(ind + 1, nums, k, &subset)
        }

        var result = 0
        if !(subset.contains(nums[ind] + k) || subset.contains(nums[ind] - k)) {
            subset.insert(nums[ind])
            defer {
                subset.remove(nums[ind])
            }
            result += backtrack(ind + 1, nums, k, &subset)
        }
        result += backtrack(ind + 1, nums, k, &subset)
        return result
    }

    func beautifulSubsets(_ nums: [Int], _ k: Int) -> Int {
        var subset = Set<Int>()
        return backtrack(.zero, nums, k, &subset)
    }
}
