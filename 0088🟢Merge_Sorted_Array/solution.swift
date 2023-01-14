class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i1 = m - 1
        var i2 = n - 1
        var i3 = m + n - 1
        while i1 > -1 && i2 > -1 {
            if nums1[i1] > nums2[i2] {
                nums1[i3] = nums1[i1]
                i1 -= 1
            } else {
                nums1[i3] = nums2[i2]
                i2 -= 1
            }
            i3 -= 1
        }
        while i1 > -1 {
            nums1[i3] = nums1[i1]
            i1 -= 1
            i3 -= 1
        }
        while i2 > -1 {
            nums1[i3] = nums2[i2]
            i2 -= 1
            i3 -= 1
        }
    }
}
