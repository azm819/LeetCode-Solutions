class Solution {
    func findIntersectionValues(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set1 = Set(nums1)
        let set2 = Set(nums2)
        var count1 = 0
        for int in nums1 where set2.contains(int) {
            count1 += 1
        }
        var count2 = 0
        for int in nums2 where set1.contains(int) {
            count2 += 1
        }
        return [count1, count2]
    }
}

