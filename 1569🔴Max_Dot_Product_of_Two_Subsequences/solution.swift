class Solution {
    private func dp(
        _ i: Int,
        _ j: Int,
        _ nums1: [Int],
        _ nums2: [Int],
        _ memo: inout [[Int?]]
    ) -> Int {
        guard i < nums1.count && j < nums2.count else {
            return .min
        }
        if let mem = memo[i][j] {
            return mem
        }
        let result = max(
            nums1[i] * nums2[j] + max(.zero, dp(i + 1, j + 1, nums1, nums2, &memo)),
            dp(i, j + 1, nums1, nums2, &memo),
            dp(i + 1, j, nums1, nums2, &memo)
        )
        memo[i][j] = result
        return result
    }

    func maxDotProduct(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var memo = Array(repeating: Array(repeating: Int?.none, count: nums2.count), count: nums1.count)
        return dp(.zero, .zero, nums1, nums2, &memo)
    }
}
