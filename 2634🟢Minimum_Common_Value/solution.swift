class Solution {
    func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var ind1 = 0
        var ind2 = 0
        while ind1 < nums1.count && ind2 < nums2.count {
            if nums1[ind1] == nums2[ind2] {
                return nums1[ind1]
            } else if nums1[ind1] < nums2[ind2] {
                ind1 += 1
            } else {
                ind2 += 1
            }
        }
        return -1
    }
}
