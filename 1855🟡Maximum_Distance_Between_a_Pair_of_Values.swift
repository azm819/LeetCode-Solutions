class Solution {
    func maxDistance(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var res = 0
        for i in 0..<min(nums1.count, nums2.count) {
            var l = i
            var r = nums2.count - 1
            while l < r {
                let c = (l + r + 1) / 2
                if nums2[c] >= nums1[i] {
                    l = c
                } else {
                    r = c - 1
                }
            }
            res = max(res, nums2[l] >= nums1[i] ? l - i : .zero)
        }
        return res
    }
}
