class Solution {
    private func search(_ nums: [Int], _ target: Int, _ selected: [Bool]) -> Int {
        var l = 0
        var r = nums.count - 1
        while l < r {
            let c = (l + r) / 2
            if nums[c] == target {
                if selected[c] {
                    l = c + 1
                } else {
                    r = c
                }
            } else if nums[c] < target {
                l = c + 1
            } else {
                r = c - 1
            }
        }
        return nums[l] == target && !selected[l] ? l : -1
    }

    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums2 = nums2.sorted()
        print(nums2)
        var selected = Array(repeating: false, count: nums2.count)
        return nums1.filter { num in
            let ind = search(nums2, num, selected)
            if ind != -1 {
                selected[ind] = true
                return true
            } else {
                return false
            }
        }
    }
}
