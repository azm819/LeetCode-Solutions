class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let a = (nums1 + nums2).sorted()
        if a.count % 2 == 0 {
            let i = a.count / 2
            return Double(a[i] + a[i - 1]) / 2
        } else {
            return Double(a[a.count / 2])
        }
    }
}
