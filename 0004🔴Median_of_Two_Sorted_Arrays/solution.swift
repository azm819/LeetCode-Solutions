class Solution {
    private func solve(
        _ k: Int,
        _ nums1: [Int],
        _ l1: Int,
        _ r1: Int,
        _ nums2: [Int],
        _ l2: Int,
        _ r2: Int
    ) -> Int {
        guard l1 <= r1 else {
            return nums2[k - l1]
        }
        guard l2 <= r2 else {
            return nums1[k - l2]
        }
        let c1 = (l1 + r1) / 2
        let c2 = (l2 + r2) / 2
        if c1 + c2 < k {
            if nums1[c1] > nums2[c2] {
                return solve(k, nums1, l1, r1, nums2, c2 + 1, r2)
            } else {
                return solve(k, nums1, c1 + 1, r1, nums2, l2, r2)
            }
        } else {
            if nums1[c1] > nums2[c2] {
                return solve(k, nums1, l1, c1 - 1, nums2, l2, r2)
            } else {
                return solve(k, nums1, l1, r1, nums2, l2, c2 - 1)
            }
        }
    }

    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let totalCount = nums1.count + nums2.count
        let k = totalCount / 2
        if totalCount % 2 == 0 {
            return Double(solve(k, nums1, 0, nums1.count - 1, nums2, 0, nums2.count - 1) + solve(k - 1, nums1, 0, nums1.count - 1, nums2, 0, nums2.count - 1)) / 2
        } else {
            return Double(solve(k, nums1, 0, nums1.count - 1, nums2, 0, nums2.count - 1))
        }
    }
}

