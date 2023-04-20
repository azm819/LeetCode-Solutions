class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else { return [-1, -1] }
        guard nums.first! <= target && nums.last! >= target else {
            return [-1, -1]
        }
        let left: Int
        if nums.first! == target {
            left = 0
        } else {
            var l = 0
            var r = nums.count - 1
            while l < r {
                let c = (l + r + 1) / 2
                if nums[c] >= target {
                    r = c - 1
                } else {
                    l = c
                }
            }
            guard l + 1 < nums.count && nums[l + 1] == target else {
                return [-1, -1]
            }
            left = l + 1
        }
        let right: Int
        if nums.last! == target {
            right = nums.count - 1
        } else {
            var l = left + 1
            var r = nums.count - 1
            while l < r {
                let c = (l + r) / 2
                if nums[c] <= target {
                    l = c + 1
                } else {
                    r = c
                }
            }
            guard r - 1 >= .zero && nums[r - 1] == target else {
                return [-1, -1]
            }
            right = r - 1
        }
        return [left, right]
    }
}
