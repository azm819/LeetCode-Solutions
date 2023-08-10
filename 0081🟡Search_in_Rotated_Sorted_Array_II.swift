class Solution {
    private func binSearch(_ nums: [Int], _ target: Int, _ l: Int, _ r: Int) -> Bool {
        guard l <= r else { return false }
        let c = (l + r) / 2

        if nums[c] == target { return true }

        if nums[l] == nums[c] && nums[c] == nums[r] {
            return binSearch(nums, target, l, c - 1) || binSearch(nums, target, c + 1, r)
        }

        let isShiftOnRight = nums[c] >= nums[l]
        if nums[c] > target {
            if isShiftOnRight {
                if nums[l] <= target {
                    return binSearch(nums, target, l, c - 1)
                } else {
                    return binSearch(nums, target, c + 1, r)
                }
            } else {
                return binSearch(nums, target, l, c - 1)
            }
        } else {
            if !isShiftOnRight {
                if nums[r] >= target {
                    return binSearch(nums, target, c + 1, r)
                } else {
                    return binSearch(nums, target, l, c - 1)
                }
            } else {
                return binSearch(nums, target, c + 1, r)
            }
        }
    }

    func search(_ nums: [Int], _ target: Int) -> Bool {
        binSearch(nums, target, .zero, nums.count - 1)
    }
}
