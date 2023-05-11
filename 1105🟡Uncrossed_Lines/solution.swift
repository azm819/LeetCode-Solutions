class Solution {
    func dp(
        _ nums1: [Int],
        _ nums2: [Int],
        _ ind1: Int,
        _ ind2: Int,
        _ memo: inout [[Int?]]
    ) -> Int {
        guard ind1 < nums1.count && ind2 < nums2.count else {
            return .zero
        }
        if let mem = memo[ind1][ind2] {
            return mem
        }
        let res: Int
        if nums1[ind1] == nums2[ind2] {
            res = 1 + dp(nums1, nums2, ind1 + 1, ind2 + 1, &memo)
        } else {
            res = max(
                dp(nums1, nums2, ind1 + 1, ind2, &memo),
                dp(nums1, nums2, ind1, ind2 + 1, &memo)
            )
        }
        memo[ind1][ind2] = res
        return res
    }

    func maxUncrossedLines(
        _ nums1: [Int],
        _ nums2: [Int]
    ) -> Int {
        var memo = Array(repeating: Array(repeating: Optional<Int>.none, count: nums2.count), count: nums1.count)
        return dp(nums1, nums2, .zero, .zero, &memo)
    }
}

